#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Environment variables
. ../env.sh


collection=confirmed
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json

collection=deaths
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json

collection=hospitalized
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json

collection=intensive_care
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json


collection=prop_variant_A
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json

collection=prop_variant_B
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json

collection=prop_variant_C
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json


# Reshape colections
mongo localhost/$DB aggregate.js
