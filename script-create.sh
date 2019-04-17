#!/bin/bash
source ./config

jsonFile=$1

printf "Creating Integration API Script from %s\n\n" "$jsonFile"
curl -u "$CREDENTIALS" --header "Content-Type: application/json" "$HOST/service/rest/v1/script/" -d @$jsonFile
