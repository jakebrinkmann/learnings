set -euxo pipefail

TMPFILE=$(mktemp --suffix '.zip'); rm $TMPFILE
FILENAME=$(mktemp --suffix '.zip'); rm $FILENAME

LAMBDA="Group-Services-FindGroupTerminalsFunction-aca5Yk9reQma"
EVENT=$(cat << __JSON__ | jq -c
{
  "site_id": "0279927",
  "terminal_id": "a8:23:fe:58:58:e9",
  "correlation_id": "bd0142d6-cf4a-4d4e-866d-db789f014292"
}
__JSON__
)
DIRNAME=$HOME/dev//find-terminals-group
HANDLER="find_group.app.lambda_handler"
ECRIMG=public.ecr.aws/sam/build-python3.9:1.36-arm64

LAMBDA="Group-Services-GetRoomTerminalsFunction-gxKjF54A0yVB"
EVENT=$(cat << __JSON__ | jq -c
{
  "version": "0",
  "id": "c16a3a23-a292-cc82-0623-ea28e4a3e784",
  "detail-type": "cloud.room.checkin.v1",
  "source": "/app-api",
  "account": "952956287553",
  "time": "2022-01-14T22:16:53Z",
  "region": "us-east-1",
  "resources": [],
  "detail": {
    "site_id": "0279927",
    "room_number": "0003",
    "correlation_id": "363f3281-f1e8-44e8-87cf-3af8c8c1af53"
  }
}
__JSON__
)
DIRNAME=$HOME/dev//get-room-terminals
HANDLER="app.lambda_handler"
ECRIMG=public.ecr.aws/sam/build-python3.9:1.36-arm64

cd $DIRNAME

# NOTE: Run in arm containers so dependencies are correct
poetry export --format requirements.txt --output src/requirements.txt --without-hashes

cd src/

aws lambda update-function-configuration --function-name $LAMBDA --handler $HANDLER --layers "arn:aws:lambda:us-east-1:017000801446:layer:AWSLambdaPowertoolsPython:4" --environment "Variables={DB_SECRET_NAME=/site_api_read_write,DB_PROXY_ENDPOINT=proxy.proxy-cx6atckrdwx5.us-east-1.rds.amazonaws.com}" | jq -r .LastUpdateStatus
sleep 25

# docker run --rm -it \
#   -v ${PWD}:/var/task:Z -w /var/task \
#   $ECRIMG \
#   /bin/sh -c "pip install --upgrade -r requirements.txt --target ."

zip -r $FILENAME ./*

aws lambda update-function-code --function-name $LAMBDA --zip-file "fileb://$FILENAME" --publish | jq -r .LastUpdateStatus
sleep 5
aws lambda invoke  --function-name $LAMBDA --invocation-type RequestResponse --log-type Tail --payload "$(echo $EVENT | base64)" $TMPFILE | jq -r .LogResult | base64 --decode
