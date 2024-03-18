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
