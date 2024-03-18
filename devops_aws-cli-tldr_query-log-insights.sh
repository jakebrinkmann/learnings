#!/usr/bin/env bash

# https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html
LOG_GROUP_NAME=${1-}
MY_QUERY="${@:2}"
START_TIME=$(date --date="${START_TIME:-30 minutes ago}" "+%s000")
END_TIME=$(date "+%s000")

if [ -z "${MY_QUERY}" ]; then
  echo 'example: '"'"'filter @message like "0284062" and @message like "PATCH"'"'"''
  echo 'example: '"'"'filter @requestId like /fcd09029-0e22-4f57-826e-a64ccb385330/'"'"''
  exit 1;
fi

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

QUERY_ID=$(aws logs start-query \
 --log-group-names $LOG_GROUP\
 --start-time $START_TIME \
 --end-time $END_TIME \
 --query-string 'fields @timestamp, @message | '"$MY_QUERY"' | sort @timestamp desc | limit 20' | jq -r .queryId)


STATUS="Running"
while [ $STATUS = "Running" ]; do
  sleep 1;
  STATUS=$(aws logs get-query-results --query-id $QUERY_ID | jq -r '.status');
done


aws logs get-query-results --query-id $QUERY_ID \
  | jq -r '.results[] | map(select(.field == "@timestamp" or .field == "@message") | .value) | @tsv'
