require 'watir-webdriver'
require 'phantomjs'

b = Watir::Browser.new :phantomjs

b.goto "www.google.com"

puts b.title

b.close