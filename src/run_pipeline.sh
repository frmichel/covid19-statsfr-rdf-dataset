#!/bin/bash

# Environment variables
. ./env.sh

log() {
    echo "[$(date '+%F %T')] $1"
}

echo "==========================================================================="

log "Download files and import into MongoDB..."
cd $PROJECT/src/mongo
. ./download.sh

# Check minimum output size
if [  $(wc -c <"$DUMP_DIR/confirmed.json") -lt  "2000000" ]; then
    log "Unexpected confirmed.json size < 2MB. Stopping."
    exit 0
fi

log "Importing files into MongoDB..."
. ./import.sh

log "Generating RDF files..."
cd $PROJECT/src/xr2rml
. ./run_xr2rml_all.sh

# Check minimum output size
if [  $(wc -c <"$DATASET_DIR/confirmed.ttl") -lt  "20000000" ]; then
    log "Unexpected confirmed.ttl output size < 20MB. Stopping."
    exit 0
fi


# Create dataset description
today=$(date '+%F')
awk "{ gsub(/{{date}}/, \"$today\"); print }" \
    $PROJECT/src/data/dataset-description_tpl.ttl > $PROJECT/src/data/dataset-description.ttl

# Replace existing graph with new one
log "Importing graph in Virtuoso..."; echo
graph="http://ns.inria.fr/covid19/datagouvfr/graph"
. $PROJECT/src/virtuoso/virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $PROJECT/src/data \
    wikidata-labels.ttl properties.ttl geographic_locations.ttl dataset-description.ttl

. $PROJECT/src/virtuoso/virtuoso-import.sh \
    --graph $graph \
    --path $DATASET_DIR \
    '*.ttl' 


log "Zipping ttl files..."
cd $PROJECT/src
zip rdf-data-${today}.zip $DATASET_DIR/*.ttl


echo; log "Done."
