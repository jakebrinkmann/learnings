LOG_GROUP_NAME="/aws/lambda/System-Event-Processor-QueueProcessor-xbOFMm15h1Gq"

aws logs filter-log-events --log-group-name $LOG_GROUP_NAME --start-time $(date --date="1 day ago" +%s000) --filter-pattern "0289045" | jq -c '.events[]'
aws logs filter-log-events --log-group-name $LOG_GROUP_NAME --start-time $(date --date="1 day ago" +%s000) --filter-pattern "Error" | jq -c '.events[]'

EVENT_PATH=$(tempfile)

LOG_STREAM_NAME='2021/08/31/[$LATEST]6e531127fa5b4316a0d31da44aa84bfc'
aws logs get-log-events --log-group-name $LOG_GROUP_NAME --log-stream-name $LOG_STREAM_NAME | jq -c '.events[].message | select(test("^Message: ")) | ltrimstr("Message: ") | fromjson' > $EVENT_PATH


aws sqs list-queues | jq -c '.QueueUrls[] | select(test("System-Event-Processor-EventSQS"))'
QUEUE_URL="https://sqs.us-east-1.amazonaws.com/974862009434/System-Event-Processor-EventSQS-B4PSTUU6UQKT"
aws sqs send-message --queue-url $QUEUE_URL --message-body file://$EVENT_PATH


aws s3api list-buckets | jq -c '.Buckets[].Name'
BUCKET_NAME="salt"
OBJECT_KEY=$(aws s3api list-objects --bucket $BUCKET_NAME | jq -c '.Contents[].Key | select(test("0289045"))' | sed 's/"//g')

aws s3api head-object --bucket $BUCKET_NAME --key $OBJECT_KEY
aws s3api get-object --bucket $BUCKET_NAME --key $OBJECT_KEY /tmp/$(basename $OBJECT_KEY)
