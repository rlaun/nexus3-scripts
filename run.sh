#!/bin/bash -e

./groovy2json.sh ./*.groovy

./script-create.sh repo-create-raw.json
./repo-create-raw.sh foo

./script-create.sh csel-create.json
./csel-create.sh bar

./script-create.sh privilege-create.json
./privilege-create.sh foo csel-bar
