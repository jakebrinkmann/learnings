#!/usr/bin/env bash

if [ -z "${1}" ]; then
  aws lambda list-functions | jq '.Functions[].FunctionName' | sort;
  exit 1;
fi

LAMBDA=$(aws lambda list-functions \
  | jq -r '.Functions[].FunctionName | select(test("'"${1}"'"))')

if [ -z "${2}" ]; then
  sam logs -n $LAMBDA --tail
else 
  sam logs -n $LAMBDA --tail "${2}"
fi
