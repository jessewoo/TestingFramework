When(/^they search for "([^"]*)"$/) do |arg|

  on_page(HomePage).search_bar = "#{arg}"
  @search_term = "#{arg}"
  on_page(HomePage).search_button

end

Then(/^RCSB should return results for "([^"]*)"$/) do |arg|
  expect(@search_term.include?("#{arg}")).to be true
  
  # puts on_page(SearchResultsPage).current_nav

# Simple Text Search
  @search_response = on_page(SearchResultsPage).search_response
  expect(@search_response.include?(@search_term)).to be true

  # Changing the view option
  # on_page(SearchResultsPage).screenshot = "Detailed"
  on_page(SearchResultsPage).view_options = "Tabular"
  # on_page(SearchResultsPage).screenshot = "Tabular"
  on_page(SearchResultsPage).view_options = "Gallery"
  # on_page(SearchResultsPage).screenshot = "Gallery"

  on_page(SearchResultsPage).view_options = "Detailed"
  on_page(SearchResultsPage).next_Page
  on_page(SearchResultsPage).screenshot = "NextPage"
  


end