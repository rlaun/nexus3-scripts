#!/bin/bash -e

# convert and upload the script
../groovy2json.sh ../repo-create-raw.groovy
./script-create.sh repo-create-raw.json


HOST="http://localhost:8081"
URI="/service/rest/v1/script/repo-create-raw/run"

curl --user admin:admin123 \
     -w "\n%{http_code}\n" \
     "${HOST}${URI}" \
     -X POST \
     -H 'Content-Type: text/plain' \
     -d '{"name":""}'
