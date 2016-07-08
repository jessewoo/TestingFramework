# Headless Testing - https://github.com/ariya/phantomjs

require 'watir-webdriver'
b = Watir::Browser.new :phantomjs
b.goto "www.google.com"
# b.render "phantomjs-google.png"
b.url #"http://www.google.com.au/"
b.title #"Google"