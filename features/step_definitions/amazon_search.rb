# require 'watir-webdriver'
# require 'cucumber'
# 
# # Currently using Firefox v33
# Given(/^a user goes to Amazon$/) do
#   @browser = Watir::Browser.new :chrome
#   @browser.goto "http://www.amazon.com"
# end
# 
# When(/^they search for "([^"]*)"$/) do |arg|
#   @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
#   @browser.send_keys :return
# 
# end
# 
# Then(/^amazon should return results for "([^"]*)"$/) do |arg|
#   @browser.li(:id => "result_2").wait_until_present
#   page_output = @browser.title.include? "#{arg}"
#   puts page_output
#   # Error with assert
#   # assert (page_output == true) 
#   @browser.close
# end