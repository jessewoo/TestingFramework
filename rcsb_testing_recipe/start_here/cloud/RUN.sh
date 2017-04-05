#!/bin/bash
# Run this script

# Clear screen
clear

echo "#################################################################################"
echo "#################################################################################"
echo "     RCSB Automated Test Framework: Testing Cloud Instance"
echo "#################################################################################"
echo "#################################################################################"

# Setup location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd ${DIR}

# Check whether an argument exist
if [ $# -eq 0 ]
  	then
    	echo "No URL argument supplied."
    	echo "Example terminal command: ./Run.sh URL=release.rcsb.org"
else
	# Check the argument, does it contain 'URL' and 'rcsb.org'
	if [[ $@ =~ "rcsb.org" ]] && [[ $@ =~ "URL=" ]]
		then
			echo " "
			echo "#################################################################################"
			echo "# Testing Cloud Instance by using Cucumber system:"
			echo "#################################################################################"

			./cucumber_cloud_instance.sh $@

			echo "#################################################################################"
			echo " "
	else
		echo "Check the rcsb.org URL, maybe missing some URL component"
		echo "Example terminal command: ./Run.sh URL=release.rcsb.org"
	fi
fi

