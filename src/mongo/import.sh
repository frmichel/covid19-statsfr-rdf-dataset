#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# Environment variables
. ../env.sh

aggregate=/tmp/aggregate_$$.js

collection=confirmed
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate

collection=deaths
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate

collection=hospitalized
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate

collection=intensive_care
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate


collection=prop_variant_A
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate

collection=prop_variant_B
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate

collection=prop_variant_C
mongoimport --type=json --drop -d $DB -c $collection $DUMP_DIR/${collection}.json
awk "{ gsub(/{{collection}}/, \"$collection\"); print }" aggregate_tpl.js > $aggregate
mongo localhost/$DB $aggregate
