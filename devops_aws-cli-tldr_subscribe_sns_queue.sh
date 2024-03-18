#!/usr/bin/env bash

TOPIC_ARN=${1-}
MY_EMAIL=${2-}

if [ -z "${TOPIC_ARN}" ]; then
  aws sns list-topics --query "Topics[].TopicArn"
  exit 0;
else
  TOPIC_ARN=$(aws sns list-topics \
    --query "Topics[?contains(TopicArn, '"$TOPIC_ARN"')].TopicArn" \
    --output text)
fi

aws sns subscribe \
  --topic-arn $TOPIC_ARN \
  --protocol email \
  --notification-endpoint $MY_EMAIL
