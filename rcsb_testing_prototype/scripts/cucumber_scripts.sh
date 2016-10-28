#!/usr/bin/env bash
# Run different cucumber scripts

# Get to the local directory
cd /Users/jessewoo/GIT/RCSB-Automated-Tests/rcsb_testing_prototype

# Run cucumber in Headless mode - default
cucumber features/basic_test_suite.feature

# Run just one test, depending on Scenario line number
cucumber features/basic_test_suite.feature:16

# Run cucumber in Chrome
cucumber CHROME=true features/basic_test_suite.feature

# Output cucumber test in HTML
cucumber -f html > output.html features/basic_test_suite.feature

# Run cucumber scenarios with the tagname @basic
cucumber --tags @basic

cucumber --tags @basic --format html

# Hide the location of each step definition
cucumber -s