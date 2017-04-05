#!/bin/bash

# Setup location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd ${DIR}

echo "# START: Testing Cucumber with Instance Luigi Legacy RCSB tests"
cd ../../framework

# URL Argument; making sure argument is passed from RUN.sh to this script
echo "URL Argument:" $@

current_time=$(date "+%Y%m%d-%H%M%S")
file_name="$current_time"_output

# Output to a log file
cucumber features/instance_luigi-legacy_rcsb.feature $@ TIME=$current_time --profile simple > ${DIR}/logs/$file_name.log

echo "# DONE!"