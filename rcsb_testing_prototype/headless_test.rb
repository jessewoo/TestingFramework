require 'watir-webdriver'

browser = Watir::Browser.new :phantomjs
browser.goto "http://cnn.com"

puts browser.url 
puts browser.title 