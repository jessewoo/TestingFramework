# GOOGLE SEARCH
Given(/^a user is at Google$/) do
  @browser.goto "http://www.google.com"
end

When(/^they enter "([^"]*)" in the search box$/) do |arg|
  @browser.text_field(:title => "Search").set "#{arg}"
  @browser.send_keys :enter
end

Then(/^they will get results for "([^"]*)"$/) do |arg|  
  @browser.text_field(:title => "Search").wait_until_present 
  assert_it ('URL has the correct param') {@browser.url.include? "#{arg}"} #this verifies q=[search term] exists in url
  assert_it ('Cucmber apepars on page results') {@browser.text_field(:title => "Search").value == "#{arg}"} #checks search div for exact match on keyword
end