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
