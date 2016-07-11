Given(/^a user goes to Rcsb Homepage$/) do
  @browser.goto "http://www.rcsb.org"
end

When(/^they search on top bar for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "autosearch_SearchBar").set "#{arg}"
  @browser.send_keys :return
end

Then(/^Rcsb SRP should return results for "([^"]*)"$/) do |arg|
  @browser.li(:id => "Current_Tab").wait_until_present
  page_output = @browser.kbd
  puts page_output
end