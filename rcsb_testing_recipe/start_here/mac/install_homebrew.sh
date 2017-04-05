#!/bin/bash
# Prepare

# Install Mac Homebrew
checkBrew=`which brew | wc -l`
if [ $checkBrew -eq 0 ]
then
    echo "# Install Mac Homebrew (Mac package manager)"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "# Updating Homebrew packages"
brew update
