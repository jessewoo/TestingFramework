require_relative 'common_searchbar'
require_relative 'common_utils'

class SearchResultsPage
  include PageObject
  include SearchBar
  include CommonPageElements
      
  # Search Results Navigation
  link(:structure_tab) {
    list_item_element(:id => "Current_Tab").link_element
  }

  # Search Results Navigation
  p(:structure_tab_count) {
    list_item_element(:id => "Current_Tab").link_element
  }

  link(:unreleased_tab) {
    list_item_element(:id => "Unreleased_Tab").link_element
  }
  link(:citation_tab) {
    list_item_element(:id => "Citation_Tab").link_element
  }
  link(:ligand_tab) {
    list_item_element(:id => "Ligand_Tab").link_element
  }
  link(:content_tab) {
    list_item_element(:id => "Content_Tab").link_element
  }
  
  h3(:visualize_panel_title) {
  	div_element(:id => 'visualize_jmol_panel').h3_element
  }

  # Search Parameter
	kbd(:search_response) {
		div_element(:id => "topNavigationSearchResults").kbd_element
	}

	# Filtering Options
	button(:next_Page, :class => "nextPage")
	button(:previous_Page, :class => "previousPage")
	text_field(:page_field, :id => "pageNum")

	# Dropdowns
	select_list(:view_Options, :id => "viewOptions")

  # Download PDB IDs
  link(:downloadButton, :id => "DownloadResultsButton")
  checkbox(:toggle_search_results, :id => "checkbox-toggle-control")
  
  checkboxes(:thumb_eachresult, css: 'div.oneSearchResult input[type="checkbox"]') 
  
  checkboxes(:thumb) { 
    unordered_list_element(:id => 'SearchResultsDetails-MainContent').checkbox_elements 
  }

	# Function to select the View Options
	def view_options=(view_options)
      @browser.select_list(:id => "viewOptions").select(view_options)
  end
  
  # Check whether Sequences Comparison Sections are loaded
  unordered_list(:search_results_list, :id => 'SearchResultsDetails-MainContent')  
  
  div(:sequence_container) {
    list_item_element(:class => 'oneSearchResult').div_element(:class => 'col-lg-12').div_element
  }

  # Generate Reports
  select_list(:reports_Options, :id => "generateReports")
  
  
  # Function to select the View Options
	def report_options=(report_options)
      @browser.select_list(:id => "generateReports").select(report_options)
  end
  

end