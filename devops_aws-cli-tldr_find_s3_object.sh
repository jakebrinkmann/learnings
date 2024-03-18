BUCKET=corporatefileimporter-corpfilebucket-18xak5bfah5x5
aws s3api list-objects --bucket $BUCKET | jq -c '.Contents[].Key' | grep "Site-Contract-Line-Item.txt" | sort | tail
