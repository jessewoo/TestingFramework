#!/bin/bash
# Run this script

# Clear screen
clear
echo "#################################################################################"
echo "#################################################################################"
echo "     RCSB Automated Test Framework: Development Envrioment Setup Script"
echo "#################################################################################"
echo "#################################################################################"

# Setup location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd ${DIR}

# Run these steps in this order
./prepare.sh
./install_homebrew.sh
./install_ruby.sh
./setup_local_dev.sh

# Test ruby!
echo "#################################################################################"
echo "# Testing result by using our Ruby system"
./quick_test.rb

# Then test cucumber!
echo "#################################################################################"
echo "# Testing results by using our Cucumber system"
./cucumber_test.sh
echo " "