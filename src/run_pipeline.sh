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
. ./import.sh

# Check minimum output size
if [  $(wc -c <"$DUMP_DIR/confirmed.json") -lt  "2000000" ]; then
    log "Unexpected confirmed.json size < 2MB. Stopping."
    exit 0
fi

log "Generating RDF files..."
cd $PROJECT/src/xr2rml
. ./run_xr2rml_all.sh

# Check minimum output size
if [  $(wc -c <"$DATASET_DIR/confirmed.ttl") -lt  "20000000" ]; then
    log "Unexpected confirmed.ttl output size < 20MB. Stopping."
    exit 0
fi

# Replace existing graph with new one
log "Importing graph in Virtuoso..."; echo
graph="http://ns.inria.fr/covid19/graph/datagouvfr"
. $PROJECT/src/virtuoso/virtuoso-import.sh \
    --cleargraph \
    --graph $graph \
    --path $PROJECT/src \
    init.ttl geographic_locations.ttl

. $PROJECT/src/virtuoso/virtuoso-import.sh \
    --graph $graph \
    --path $DATASET_DIR \
    '*.ttl' 

echo; log "Done."
