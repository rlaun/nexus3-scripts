#!/bin/bash
source ./config

REPO=$1
URI="/service/rest/v1/script/repo-create-raw/run"

if [ -z "$REPO" ]; then
  echo Error: you must specify a repository name
fi

echo "Creating raw repository: $REPO"

curl --user "$CREDENTIALS" \
     -w "\n%{http_code}\n" \
     "${HOST}${URI}" \
     -X POST \
     -H 'Content-Type: text/plain' \
     -d '{"name":"'$REPO'"}'
