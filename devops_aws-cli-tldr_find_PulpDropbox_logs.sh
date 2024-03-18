#!/usr/bin/env bash
MY_QUERY='"app-5.2.2-1.fc32.x86_64.rpm"'
GROUP="/aws/lambda/PulpDropBox-DropBoxLambda-e6JscLnDec8b"
aws logs filter-log-events \
  --log-group-name $GROUP \
  --start-time $(date --date="1 day ago" +%s000) \
  --filter-pattern "$MY_QUERY"

STREAM='2021/09/28/[$LATEST]dc262970bde94a9d86a00ba91f5e62a4'
aws logs filter-log-events --log-stream-names $STREAM --log-group-name $GROUP --query "events[].message"
