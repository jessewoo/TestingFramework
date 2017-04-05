#! /usr/local/bin/ruby

# Prepare
puts "# START: Simple test - This should show the Title and URL of www.rcsb.org"
# $DEBUG = true
require 'rubygems'
require 'watir'

# Work
b = Watir::Browser.new :phantomjs
b.goto 'http://www.rcsb.org'
puts b.title
puts b.url
b.close

# Close
puts "# DONE: Simple test"
