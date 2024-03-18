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
