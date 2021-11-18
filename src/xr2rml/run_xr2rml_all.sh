#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored
mkdir -p $DATASET_DIR

./run_xr2rml.sh xr2rml_announcements.ttl  $DATASET_DIR/announcements.ttl
./run_xr2rml.sh xr2rml_confirmed.ttl      $DATASET_DIR/confirmed.ttl
./run_xr2rml.sh xr2rml_deaths.ttl         $DATASET_DIR/deaths.ttl
./run_xr2rml.sh xr2rml_hospitalized.ttl   $DATASET_DIR/hospitalized.ttl
./run_xr2rml.sh xr2rml_intensive_care.ttl $DATASET_DIR/intensive_care.ttl

#./run_xr2rml.sh     xr2rml_prop_variant_A.ttl $DATASET_DIR/prop_variant_A.ttl
#./run_xr2rml.sh     xr2rml_prop_variant_B.ttl $DATASET_DIR/prop_variant_B.ttl
#./run_xr2rml.sh     xr2rml_prop_variant_C.ttl $DATASET_DIR/prop_variant_C.ttl