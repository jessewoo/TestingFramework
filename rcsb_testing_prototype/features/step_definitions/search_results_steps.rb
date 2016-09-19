When(/^they search for "([^"]*)"$/) do |arg|
  on_page(HomePage).search_bar = "#{arg}"
  on_page(HomePage).search_button
end

Then(/^RCSB should return results for "([^"]*)"$/) do |arg|
  on_page(SearchResultsPage)


  @browser.li(:id => "Current_Tab").wait_until_present
  page_output = @browser.kbd.text
  puts page_output
  assert_it ('Verified RCSB Results') { @browser.kbd.text.include?  "#{arg}"} 
end