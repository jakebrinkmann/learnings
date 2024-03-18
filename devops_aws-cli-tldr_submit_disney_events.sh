#!/usr/bin/env bash

if [ ! -z ${1} ]; then
  QUEUE_URL=$(aws sqs list-queues \
    | jq -r '.QueueUrls[] | select(test("'$1'"))');
else
  aws sqs list-queues --query 'QueueUrls';
  exit 1
fi

SITE_ID=${2:-0000057}

MSG=$(echo '{
    "type": "checkout",
    "source": {
      "room": "8204", 
      "occupied": false, 
      "reservations": []
    }, 
    "version": "1.0.0", 
    "integration_timestamp": "2021-11-04T16:08:44.092000+00:00", 
    "event_id": "JAKE IS TESTING THINGS", 
    "site_id": "0000057"
  }' | jq -c '.' )

aws sqs send-message --message-group-id $SITE_ID \
  --queue-url $QUEUE_URL \
  --message-body "$MSG"

