#!/bin/bash

me=`whoami`
if [ -d /Users/${me}/Library/Caches/Homebrew ]
then
    echo "# Purging prior Homebrew cache (root privilege required)"
    sudo rm -rf /Users/${me}/Library/Caches/Homebrew
fi

if [ -d /Users/${me}/.rvm ]
then
    echo "# Purging prior rvm cache (root privilege required)"
    sudo rm -rf /Users/${me}/.rvm
fi
