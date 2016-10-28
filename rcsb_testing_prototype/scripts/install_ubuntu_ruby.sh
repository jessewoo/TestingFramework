#!/usr/bin/env bash
# Install Testing Framework and RUBY into Ubuntu cloud environment for testing framework

# Ubuntu version
Ubuntu_Version=$(lsb_release -r -s)
if [ $Ubuntu_Version = "16.04" ]; then
    PHANTOMJS_VERSION="v2.1.1"
    echo "$PHANTOMJS_VERSION"
fi

# GIT the RCSB automated Test code - in /home/ubuntu/
git clone git@github.com:rcsb/RCSB-Automated-Tests.git


# Install Ruby Environment
sudo apt-get install ruby-full
clear
gem list

cd /home/ubuntu/RCSB-Automated-Tests/rcsb_testing_prototype/
gem install bundler
bundle install
gem list