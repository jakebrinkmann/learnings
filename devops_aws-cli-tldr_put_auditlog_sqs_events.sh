#!/usr/bin/env bash
# SCENARIO: Test the integration from AuditLogging SQS to DBWriter Lambda
SOURCE_SQS_QUEUE=Pms-Audit-Logging-AuditLoggingQueue
DESTINATION_LAMBDA=Pms-Audit-Logging-DbWriterFunction
set -eoux pipefail

timestamp=$(date "+%s000")

EVENTS=$(cat << EOF | jq -c
{
  "correlation_id": "38062a15-2f34-4e12-af36-047acdc12249",
  "timestamp": 1640557342655,
  "site_id": "0283502",
  "room_id": "304",
  "event_type": "look",
  "event_source": "api.cloud",
  "event_body": null
}
EOF
)

QUEUE=$(aws sqs list-queues | jq -r '.QueueUrls[] | select(test("'$SOURCE_SQS_QUEUE'"))')
GROUP=$(aws logs describe-log-groups | jq -r '.logGroups[].logGroupName | select(test("'$DESTINATION_LAMBDA'"))')

aws sqs send-message \
  --queue-url $QUEUE \
  --message-body "$EVENTS"

sleep 60

aws logs tail --since '3m' --format short "$GROUP"
