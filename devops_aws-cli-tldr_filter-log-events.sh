#!/usr/bin/env bash

LOG_GROUP_NAME=${1-} # API-ResourceFunction
MY_QUERY="${@:2}"
START_TIME=$(date --date="${START_TIME:-30 minutes ago}" "+%s000")
END_TIME=$(date "+%s000")

if [ -z "${LOG_GROUP_NAME}" ]; then
  aws logs describe-log-groups --query 'logGroups[].logGroupName'
  exit 0;
else
  LOG_GROUP=$(aws logs describe-log-groups --query 'logGroups[].logGroupName' | \
    jq -r '. | map(select(test("'$LOG_GROUP_NAME'"))) | .[0]')

  if [ -z "$LOG_GROUP" ]; then
    echo "$LOG_GROUP_NAME not found"
    exit 1
  fi
fi


RESULTS=$(aws logs filter-log-events \
 --log-group-name $LOG_GROUP \
 --start-time $START_TIME \
 --end-time $END_TIME \
 --filter-pattern "$MY_QUERY" | jq -r '.events')

if [ "$RESULTS" != "[]" ]; then
  case $VARIANT in
    0)
      START_TIME=$(echo "$RESULTS" | jq -r '.[0].timestamp')
      END_TIME=$(echo "$RESULTS" | jq -r '.[-1].timestamp')
      aws logs filter-log-events \
        --log-group-name $LOG_GROUP \
        --start-time $START_TIME \
        --end-time $END_TIME | jq -r .events[].message;;
    *)
      # # Variant ii
      LOG_STREAM=$(echo "$RESULTS" | jq -r '.[-1].logStreamName')
      aws logs filter-log-events \
        --log-group-name $LOG_GROUP \
        --log-stream-names $LOG_STREAM \
        | jq -r .events[].message;;
    esac
else
  echo 'No results!!' && false
fi
