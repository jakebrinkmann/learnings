#!/usr/bin/env bash

# Verify an email address so it can recieve email from our sandbox SES

EMAILADDR=${1}

aws ses verify-email-identity --email-address ${EMAILADDR}
#!/usr/bin/env bash

tmpfile=$(mktemp /tmp/my-function-XXXX.zip)
rm $tmpfile

CODE_LOC=/home/jbrinkma/dev/
cd $CODE_LOC || exit 1

LAMBDA_NAME=$(aws lambda list-functions \
    | jq -r '.Functions[].FunctionName | select(test("SNC"))')

pip install --upgrade -r requirements.txt --target .
zip $tmpfile -r ./* &> /dev/null

RESULT=$(aws lambda update-function-code \
    --function-name $LAMBDA_NAME \
    --zip-file "fileb://$tmpfile" \
    --publish)

echo "$RESULT" | jq -r .LastUpdateStatus

# aws lambda update-function-configuration \
#     --function-name $LAMBDA_NAME \
#     --timeout 30 \
#     --memory-size 256 | jq -r .LastUpdateStatus

rm $tmpfile
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

EVENT=$(cat << '__END__' | jq -c
[
  {
    "EventBusName": "Late-Checkout",
    "Source": "/late-checkout",
    "DetailType": "cloud.late-checkout.failed.v1",
    "Detail": "{\"site_id\": \"0279927\", \"room_number\": \"0010\", \"id\": \"friday-testing\"}"
  }
]
__END__
)

aws events put-events --entries "$EVENT"
GROUP_NAME="/aws/lambda/API-ResourceFunction-GSEWHYPFOAUH"

aws logs filter-log-events --log-group-name $GROUP_NAME --start-time $(date --date="1 day ago" +%s000) --filter-pattern "system.resource" | jq -c '.events[].message | select(test("^Send Event: ")) | sub("^Send Event: .*Detail.*{"; "{") | sub("}.*"; "}")| fromjson'
LOG_GROUP_NAME="/aws/lambda/API-ResourceFunction-3YD4I82B6Q9C"

START_DATE_TIME=$(date --date="1 month ago" +%s000)
aws logs filter-log-events \
   --log-group-name $LOG_GROUP_NAME \
   --start-time $START_DATE_TIME \
   --filter-pattern "purchase_id" | jq -c '.events[] | select(.message | test("Sending request:")) | .message | ltrimstr("Sending request: ") | fromjson | .parameters.purchase_id' > /tmp/FILENAME


python <<EOF

with open('/tmp/FILENAME') as fid:
    lines = fid.readlines()

import re

reg = re.compile('(^([0-9A-Za-z][0-9]{5}[0-9A-F]{4})|([0-9A-Za-z][0-9]{5}[A-Z]{2}[0-9]{5})$)|(^__unknown__$)')

for line in lines:
    l = line.replace('"', '').strip()
    m = reg.match(l)
    print(f"{m} {l}")
EOF
#!/usr/bin/env bash
MY_QUERY='"app-5.2.2-1.fc32.x86_64.rpm"'
GROUP="/aws/lambda/PulpDropBox-DropBoxLambda-e6JscLnDec8b"
aws logs filter-log-events \
  --log-group-name $GROUP \
  --start-time $(date --date="1 day ago" +%s000) \
  --filter-pattern "$MY_QUERY"

STREAM='2021/09/28/[$LATEST]dc262970bde94a9d86a00ba91f5e62a4'
aws logs filter-log-events --log-stream-names $STREAM --log-group-name $GROUP --query "events[].message"
