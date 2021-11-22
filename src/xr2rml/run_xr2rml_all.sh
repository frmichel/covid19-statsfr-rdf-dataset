#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored
mkdir -p $DATASET_DIR


echo "Generating triples for announcements..."
./run_xr2rml.sh xr2rml_announcements.ttl  $DATASET_DIR/announcements.ttl
echo "Generating triples for confirmed cases..."
./run_xr2rml.sh xr2rml_confirmed.ttl      $DATASET_DIR/confirmed.ttl
echo "Generating triples for deaths..."
./run_xr2rml.sh xr2rml_deaths.ttl         $DATASET_DIR/deaths.ttl
echo "Generating triples for hospitalized cases..."
./run_xr2rml.sh xr2rml_hospitalized.ttl   $DATASET_DIR/hospitalized.ttl
echo "Generating triples for intesnsive care cases..."
./run_xr2rml.sh xr2rml_intensive_care.ttl $DATASET_DIR/intensive_care.ttl
echo "Generating triples for propagation A..."
./run_xr2rml.sh xr2rml_propagationA.ttl $DATASET_DIR/prop_variant_A.ttl
echo "Generating triples for propagation B..."
./run_xr2rml.sh xr2rml_propagationB.ttl $DATASET_DIR/prop_variant_B.ttl
echo "Generating triples for propagation C..."
./run_xr2rml.sh xr2rml_propagationC.ttl $DATASET_DIR/prop_variant_C.ttl
