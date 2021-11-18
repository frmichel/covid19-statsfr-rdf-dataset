#!/bin/bash

# Environment variables
. ../env.sh

mkdir -p $DUMP_DIR
DOWNLOAD_URL=https://data.widgets.dashboard.covid19.data.gouv.fr

curl $DOWNLOAD_URL/cas_positifs.json      -o $DUMP_DIR/confirmed.json
curl $DOWNLOAD_URL/deces.json             -o $DUMP_DIR/deaths.json
curl $DOWNLOAD_URL/hospitalisations.json  -o $DUMP_DIR/hospitalized.json
curl $DOWNLOAD_URL/soins_critiques.json   -o $DUMP_DIR/intensive_care.json

curl $DOWNLOAD_URL/prop_variant_A.json    -o $DUMP_DIR/prop_variant_A.json
curl $DOWNLOAD_URL/prop_variant_B.json    -o $DUMP_DIR/prop_variant_B.json
curl $DOWNLOAD_URL/prop_variant_C.json    -o $DUMP_DIR/prop_variant_C.json
