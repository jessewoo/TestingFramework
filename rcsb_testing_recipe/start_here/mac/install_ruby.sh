#!/bin/bash
# Prepare

# Config
ruby_version="2.3.0"

# Install framework to compile + install Ruby
check_prior=`which ruby-build | wc -l`
if [ $check_prior -eq 0 ]
then
    brew install readline libyaml openssl
    brew install rbenv
    brew install ruby-build
fi

# Only install version X of Ruby IF it is not already installed (compiled) locally
if [ ! -d ~/.rbenv/versions/${ruby_version} ]
then
    echo "# Installing Ruby ${ruby_version}"
    rbenv install ${ruby_version}
else
    echo "# Ruby ${ruby_version} previously installed [Installed @ ~/.rbenv/versions/${ruby_version}]"
fi

# Make sure Ruby was able to install properly
if [ ! -d ~/.rbenv/versions/${ruby_version} ]
then
    echo "# ERROR: Ruby failed to install!!! Aborting linking step."
    exit
fi

echo "# Linking installed results"
cd ~/.rbenv/versions/${ruby_version}/bin
for file in `ls`
do
    # If previous symlink exists, remove
    if [ -L /usr/local/bin/$file ]
    then
        rm -f /usr/local/bin/$file
    fi

    # Create new link to our versions ONLY if they can be linked (somthing already does not exist or is installed in that spot)
    if [ ! -f /usr/local/bin/$file ]
    then
        echo "# Linking [/usr/local/bin/$file] -> [~/.rbenv/versions/${ruby_version}/bin/$file]"
        ln -s ~/.rbenv/versions/${ruby_version}/bin/$file /usr/local/bin/$file
    fi
done
echo "# Setting up alternate path to our installed Ruby version"
if [ -L /usr/local/opt/ruby ]
then
    rm -f /usr/local/opt/ruby
fi
ln -sv ~/.rbenv/versions/${ruby_version} /usr/local/opt/ruby
