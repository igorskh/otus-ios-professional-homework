#!/bin/sh
API_LIST=("metaweather" "newsapi")
SWIFT_MODULE_SRC="Modules/Networking/Sources"

for a in ${API_LIST[@]}; do
  openapi-generator generate -i "$a.yaml" -g swift5 -o $a
done

rm -r $SWIFT_MODULE_SRC

mkdir $SWIFT_MODULE_SRC

for a in ${API_LIST[@]}; do
  cp -R "$a/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC/$a
  rm -r $a
done
