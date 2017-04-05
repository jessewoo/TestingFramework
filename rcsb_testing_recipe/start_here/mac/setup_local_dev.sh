#!/bin/bash
# Sets up required development environment for this project

# Config
ruby_version="2.3.0"

# Setup location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd ${DIR}

# Checking ruby version immediatly prior to use of Ruby to install Gems
echo "# Ruby version"
ruby -v

echo "# Installing project Ruby level dependencies"
cd ../../framework
# Update gem's
gem update --system
# Install bundler
gem install bundler
# If installed, make sure up to date
gem update bundler
# Now link back out so it is easy to access (for bundle)
if [ -L /usr/local/bin/bundle ]
then
    rm -f /usr/local/bin/bundle
fi
if [ ! -f /usr/local/bin/bundle ]
then
    echo "# Linking [/usr/local/bin/bundle] -> [~/.rbenv/versions/${ruby_version}/bin/bundle]"
    ln -s ~/.rbenv/versions/${ruby_version}/bin/bundle /usr/local/bin/bundle
fi
# Use bundler to bundle & 'install' this code base
bundle install
# Then, make sure the codebase if fully updated
bundle update
# Now, link back Cucumber (only if cucumber was installed)
if [ -f ~/.rbenv/versions/${ruby_version}/bin/cucumber ]
then
    # Remove what exists now, if it exsists
    if [ -f /usr/local/bin/cucumber ]
    then
        rm -f /usr/local/bin/cucumber
    fi
    # Create a link to what we jsut installed
    if [ ! -f /usr/local/bin/cucumber ]
    then
        echo "# Linking [/usr/local/bin/cucumber] -> [~/.rbenv/versions/${ruby_version}/bin/cucumber]"
        ln -s ~/.rbenv/versions/${ruby_version}/bin/cucumber /usr/local/bin/cucumber
    fi
fi

#echo "# Checking Ruby Gem list"
#gem list

check_wget=`which wget | wc -l`
if [ $check_wget -eq 0 ]
then
    echo "# Installing wget"
    brew install wget
fi

# +++++ CHROME BROWSER +++++
# Installing the new version of Chromedriver
# Need to have version 2.24 and higher
if [ ! -f /usr/local/bin/chromedriver ]
then
    cd /tmp
    wget http://chromedriver.storage.googleapis.com/2.28/chromedriver_mac64.zip
    unzip chromedriver_mac64.zip
    mv chromedriver /usr/local/bin
fi

# +++++ FIREFOX INSTALLATION +++++
# Installing the new version of Mozilla / Gecko
if [ ! -f /usr/local/bin/geckodriver ]
then
    cd /tmp
    wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-macos.tar.gz
    tar -xvzf geckodriver-v0.11.1-macos.tar.gz
    mv geckodriver /usr/local/bin
fi

# +++++ PHANTOMJS INSTALLATION +++++
if [ ! -f /usr/local/bin/phantomjs ]
then
    cd /tmp
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip
    unzip phantomjs-2.1.1-macosx.zip
    cd phantomjs-2.1.1-macosx/bin
    mv phantomjs /usr/local/bin
fi

echo "# Checking Cucumber"
cucumber --version
