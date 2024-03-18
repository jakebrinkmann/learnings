#!/usr/bin/env bash
# SCENARIO: Test the integration from CloudWatch to our Log Processor Lambda
# GIVEN: The Cloudwatch logstream exists
#  AND: The FilterSubscription is in place to destination function
# WHEN: I submit an event which matchs the filter to the SOURCE log group
# THEN: I will see my DESTINATION lambda was triggered
SOURCE_LOG_GROUP=Site-WS-EventFunction
DESTINATION_LAMBDA=Pms-Audit-Logging-LogProcessorFunction

timestamp=$(date "+%s000")
message='Event: { \"type\": \"link-status\" }'

EVENTS=$(cat << EOF | jq -c
[
  {
    "timestamp": $timestamp,
    "message": "$message"
  }
]
EOF
)

GROUP=$(aws logs describe-log-groups | jq -r '.logGroups[].logGroupName | select(test("Site-WS-EventFunction"))')
STREAM=$(date "+%Y%m%d")
aws logs create-log-stream --log-group-name $GROUP --log-stream-name $STREAM

aws logs put-log-events \
  --log-group-name $GROUP \
  --log-stream-name $STREAM \
  --log-events "$EVENTS"

sleep 10
aws logs delete-log-stream --log-group-name $GROUP --log-stream-name $STREAM

GROUP=$(aws logs describe-log-groups | jq -r '.logGroups[].logGroupName | select(test("LogProcessorFunction"))')
aws logs tail --since '3m' --format short "$GROUP"
