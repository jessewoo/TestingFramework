#!/usr/bin/env bash
# Install PHANTOMJS into Ubuntu cloud environment for testing framework

PHANTOM_VERSION="phantomjs-2.1.1"
PHANTOM_DIR_VERSION="v2.1.1"
ARCH=$(uname -m)

if ! [ $ARCH = "x86_64" ]; then
    $ARCH="i686"
fi

sudo apt-get update
sudo apt-get install build-essential chrpath libssl-dev libxft-dev -y
sudo apt-get install libfreetype6 libfreetype6-dev -y
sudo apt-get install libfontconfig1 libfontconfig1-dev -y
sudo apt-get install msttcorefonts

cd ~
PHANTOM_JS="$PHANTOM_VERSION-linux-$ARCH"
wget https://github.com/Medium/phantomjs/releases/download/$PHANTOM_DIR_VERSION/$PHANTOM_JS.tar.bz2
sudo tar xvjf $PHANTOM_JS.tar.bz2
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

phantomjs --version