#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 [groovy_file]..."
  exit 1
fi

for arg in "$@"; do
 if [[ ! -e $arg ]]; then
   echo Error: File not found: $arg
   exit 1
 fi
done


for arg in "$@"; do
  file=$arg
  name=$(basename -s '.groovy' $file)
  
  leGroovy=$(cat $file | awk '{ printf("%s\\n", $0) }')
  
  echo '{
    "name": "'$name'",
    "type": "groovy",
    "content": "'$leGroovy'"
  }' > $name.json
  echo Wrote $name.json
done
 
