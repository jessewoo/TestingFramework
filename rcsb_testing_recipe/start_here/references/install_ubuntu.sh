#!/bin/sh

echo "### Running $0"

# Config
PHANTOM_VERSION="2.1.1"
ARCH=$(uname -m)
if ! [ $ARCH = "x86_64" ]; then
    $ARCH="i686"
fi
PHANTOM_JS="phantomjs-$PHANTOM_VERSION-linux-$ARCH"


echo "# Downloading RCSB Automated Test Framework from Git"
if [ -d /opt/testing ]
then
  rm -rf /opt/testing
fi
mkdir /opt/testing
cd /opt/testing
git clone git@github.com:rcsb/RCSB-Automated-Tests.git .

echo "# Installing Ruby"
apt-get -yqq install ruby-full
gem list

echo "# Installing Ruby Gems"
cd /opt/testing/framework/
gem install bundler
bundle install
gem list

# NOTE: 'apt-get -yqq install phantomjs' will not have PhantomJS working correctly, will get QXcbConnection (X11) error
# Instead, the system needs to build PhantomJS without X11 headers (dev package installed)
# Will need to change phantomJS version, when there are updates

echo "# Installing Phantom JS dependencies (packages)"
sudo apt-get -yqq install build-essential chrpath libssl-dev libxft-dev >> /var/log/rcsb-scripts/std-out 2>> /var/log/rcsb-scripts/std-err
sudo apt-get -yqq install libfreetype6 libfreetype6-dev >> /var/log/rcsb-scripts/std-out 2>> /var/log/rcsb-scripts/std-err
sudo apt-get -yqq install libfontconfig1 libfontconfig1-dev >> /var/log/rcsb-scripts/std-out 2>> /var/log/rcsb-scripts/std-err

echo "# Downloading PhantonJS from source"
cd /tmp
wget https://github.com/Medium/phantomjs/releases/download/v${PHANTOM_VERSION}/${PHANTOM_JS}.tar.bz2

echo "# Extracting"
tar -xvjf ${PHANTOM_JS}.tar.bz2 >> /var/log/rcsb-scripts/std-out 2>> /var/log/rcsb-scripts/std-err

echo "# Linking"
mv $PHANTOM_JS /usr/local/share/
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs

echo "# Result"
phantomjs --version
