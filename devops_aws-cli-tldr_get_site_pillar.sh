account="dev"
site="0290912"

BUCKET_NAME=$(aws s3api list-buckets | jq -r '.Buckets  | map(select(.Name | test("'"$account"'-salt"))) | .[0].Name')

OBJECT_KEY=$(aws s3api list-objects --bucket $BUCKET_NAME | jq -r '.Contents | map(select(.Key | test("'$site'"))) | .[0].Key')

FILENAME=/tmp/$(basename $OBJECT_KEY)

aws s3api head-object --bucket $BUCKET_NAME --key $OBJECT_KEY
aws s3api get-object --bucket $BUCKET_NAME --key $OBJECT_KEY $FILENAME

echo $FILENAME
cat $FILENAME
