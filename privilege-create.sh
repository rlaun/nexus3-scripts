#!/bin/bash
source ./config

REPO=$1
CSEL=$2
URI="/service/rest/v1/script/privilege-create/run"

#if [ -z "$REPO" ]; then
#  echo Error: you must specify a repository name
#fi

echo "Creating privilege for repo $REPO with csel $CSEL"

curl --user "$CREDENTIALS" \
     -w "\n%{http_code}\n" \
     "${HOST}${URI}" \
     -X POST \
     -H 'Content-Type: text/plain' \
     -d '{"repo":"'$REPO'", "csel":"'$CSEL'"}'
