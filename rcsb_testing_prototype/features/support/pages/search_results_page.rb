require_relative 'search_bar'

class SearchResultsPage 
  include PageObject
  include SearchBar
      
  	li(:current_nav, :id => "Current_Tab")

  	# Browser Title


    # Search Response
	kbd(:search_response) {
		div_element(:id => "topNavigationSearchResults").kbd_element
	}

	# Fitlering Options
	button(:next_Page, :class => "nextPage")
	button(:previous_Page, :class => "previousPage")
	text_field(:page_field, :id => "pageNum")

	# Dropdowns
	select_list(:view_Options, :id => "viewOptions")



	# Function to select the View Options
	def view_options=(view_options)
      @browser.select_list(:id => "viewOptions").select(view_options)
  	end

	# Screenshot after page is loaded
  	def screenshot=(view_options)
      sleep 1
  	  @browser.screenshot.save 'screenshot_' + view_options + '.png'
  	end

end