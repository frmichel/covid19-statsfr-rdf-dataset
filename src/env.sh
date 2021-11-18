#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

export PROJECT=/appli/covid19-statsfr-rdf-dataset

# Directory for raw data files
export DUMP_DIR=$PROJECT/src/mongo/dumps

# Directory for RDF files
export DATASET_DIR=$PROJECT/src/xr2rml/dataset

# MongoDB database
export DB=covid19datagouvfr


export DATASET_VERSION=1.0
export DATASET_DATE=2021-01-01
