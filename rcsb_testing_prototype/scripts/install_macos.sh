#!/usr/bin/env bash
# Installing ruby and gems on macOS

# Install Homebrew - package manager for OSX to install open source tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

# Get the latest version of ruby
brew install ruby

# Install RVM
# curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
\curl -L https://get.rvm.io | bash -s stable

# Check to see if RVM was successfully installed. Should get "rvm is a function"
type rvm | head -1
rvm get stable

# Version of RVM - should get rvm 1.26.10 or higher
rvm -v

# Version of Ruby - should get ruby 2.2.0 or higher
ruby -v

rvm list
rvm install ruby-2.3.0
rvm --default use 2.3.0

# Verify the version of Ruby
ruby -v

# Check your gem list
gem list

cd /GIT/RCSB-Automated-Tests/rcsb_testing_prototype/
gem install bundler
bundle install

# Check your gem list
gem list


# Installing the new version of Chromedriver
brew install chromedriver
# Needs to version version 2.24 and higher
# http://chromedriver.storage.googleapis.com/index.html?path=2.25/

cd $HOME/Downloads
wget http://chromedriver.storage.googleapis.com/2.25/chromedriver_mac64.zip
unzip chromedriver_mac64.zip

# Remove the chromedriver in local/bin
cd /usr/local/bin
rm -f chromedriver

# Go back to Download folder, move the chromedriver to local/bin
cd $HOME/Downloads
mv chromedriver /usr/local/bin
which chromedriver


# Installing the new version of Mozilla / Gecko
cd $HOME/Downloads
wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-macos.tar.gz
unzip geckodriver-v0.11.1-macos.tar.gz
mv geckodriver /usr/local/bin



