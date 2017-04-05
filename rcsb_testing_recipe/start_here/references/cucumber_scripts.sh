#!/usr/bin/env bash

# Checking the internet connection on computer network
ping -c 10 www.rcsb.org
wget www.rcsb.org

# Run cucumber in Headless mode - default
cucumber features/legacy_rcsb_basic_test_suite.feature

# Run just one test, depending on Scenario line number
cucumber features/legacy_rcsb_basic_test_suite.feature:16

# Run cucumber in Chrome
cucumber CHROME=true features/legacy_rcsb_basic_test_suite.feature

# Run cucumber with URL as an argument
cucumber URL=www.rcsb.org features/legacy_rcsb_basic_test_suite.feature

# Output cucumber test in HTML
cucumber -f html > output.html features/legacy_rcsb_basic_test_suite.feature

# Run cucumber scenarios with the tagname @basic
cucumber --tags @basic

cucumber --tags @basic --format html

# Hide the location of each step definition
cucumber -s

# Rake - run all the cucumber feature tests as TASK
# Be in the directory "framework" where Rakefile exist
rake

# Experimenting using command line arguments like URL
cucumber URL=www.google.com --profile=export features/testing_with_arguments.feature
cucumber URL=www.google.com CHROME=true --profile=export features/testing_with_arguments.feature