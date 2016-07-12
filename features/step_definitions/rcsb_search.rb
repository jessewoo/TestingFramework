# USER SEARCHES ONE TERM
Given(/^a user goes to RCSB$/) do
  @browser.goto "http://www.rcsb.org"
end

When(/^they search for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "autosearch_SearchBar").set "#{arg}"
  @browser.send_keys :return
end

Then(/^RCSB should return results for "([^"]*)"$/) do |arg|
  @browser.li(:id => "Current_Tab").wait_until_present
  page_output = @browser.kbd.text
  puts page_output
  assert_it ('Verified RCSB Results') { @browser.kbd.text.include?  "#{arg}"} 
end

# QUERY MULTIPLE SEARCHES
When(/^the user looks for (.*)$/) do |query|
  @browser.text_field(:id => "autosearch_SearchBar").set "#{query}"
  @browser.send_keys :return
end

Then(/^the results returned will display (.*)$/) do |query|
  @browser.li(:id => "Current_Tab").wait_until_present
  assert_it ('Verfied Results Display'){ @browser.kdb.text.include? "#{query}"}
end