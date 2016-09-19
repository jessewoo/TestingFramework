class SearchResultsPage 
  include PageObject
      

	page_output = @browser.kbd.text


	kbd(:search_response) {
		div_element(:id => "topNavigationSearchResults").kbd_element
	}

end