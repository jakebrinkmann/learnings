STATEMACHINE=arn:aws:states:us-east-1:952956287553:stateMachine:Group-Services-TerminalLineupChanged
EVENT=$(cat <<__JSON__
{
  "version": "0",
  "id": "3cccd183-bd5e-d43e-95c5-3415b971795e",
  "detail-type": "cloud.terminal.updated.v1",
  "source": "/app-api",
  "account": "952956287553",
  "time": "2022-01-10T21:20:32Z",
  "region": "us-east-1",
  "resources": [],
  "detail": {
    "site_id": "0279927",
    "terminal_id": "a8:23:fe:58:58:e9",
    "correlation_id": "bd0142d6-cf4a-4d4e-866d-db789f014292"
  }
}
__JSON__
)


aws stepfunctions start-execution --state-machine-arn $STATEMACHINE --input "$EVENT"
