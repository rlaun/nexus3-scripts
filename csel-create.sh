#!/bin/bash
source ./config

TARGET=$1
URI="/service/rest/v1/script/csel-create/run"

curl --user admin:admin123 \
     -w "\n%{http_code}\n" \
     "${HOST}${URI}" \
     -X POST \
     -H 'Content-Type: text/plain' \
     -d '{"name":"'csel-$TARGET'", "csel":"format == \"raw\" and path =^ \"/'$TARGET'/\"", "comment":"automatically generated"}'
