# require 'watir-webdriver'
# require 'cucumber'
# 
# # Currently using Chrome thru Watir-webdriver
# Given(/^a user goes to Rcsb$/) do
#   @browser = Watir::Browser.new :chrome
#   @browser.goto "http://www.rcsb.org"
# end
# 
# When(/^they search for "([^"]*)"$/) do |arg|
#   @browser.text_field(:id => "autosearch_SearchBar").set "#{arg}"
#   @browser.send_keys :return
# end
# 
# Then(/^Rcsb should return results for "([^"]*)"$/) do |arg|
#   @browser.li(:id => "Current_Tab").wait_until_present
#   page_output = @browser.kbd
#   puts page_output
#   @browser.close
# end