#!/bin/bash
#
# This script runs Morph-xR2RML with an xR2RML mapping file
# Input argument:
# - arg1: xR2RML template mapping file
# - arg2: output file name
#
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
#
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

XR2RML=.
JAR=$XR2RML/morph-xr2rml-dist-1.3.1-jar-with-dependencies.jar


help()
{
  exe=$(basename $0)
  echo "Usage: $exe <xR2RML mapping template> <output file name>"
  exit 1
}

# --- Read input arguments
mappingFile=$1
if [[ -z "$mappingFile" ]] ; then help; fi

output=$2
if [[ -z "$output" ]] ; then help; fi


# --- Init log file
mkdir -p $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_${mappingFile}.log
echo -n "" > $log


echo "--------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx24g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$JAR" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile $mappingFile \
     --output $output \
     >> $log
date >> $log
