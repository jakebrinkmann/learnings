GROUP_NAME="/aws/lambda/API-ResourceFunction-GSEWHYPFOAUH"

aws logs filter-log-events --log-group-name $GROUP_NAME --start-time $(date --date="1 day ago" +%s000) --filter-pattern "system.resource" | jq -c '.events[].message | select(test("^Send Event: ")) | sub("^Send Event: .*Detail.*{"; "{") | sub("}.*"; "}")| fromjson'
