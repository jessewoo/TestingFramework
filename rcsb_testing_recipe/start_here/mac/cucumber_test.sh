#!/bin/bash

# Setup location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd ${DIR}

echo "# START: Testing Cucumber with Legacy RCSB Test Suite"
cd ../../framework
cucumber features/legacy_rcsb_basic_tests_suite.feature:3
echo "# DONE: Simple Cucumber test"