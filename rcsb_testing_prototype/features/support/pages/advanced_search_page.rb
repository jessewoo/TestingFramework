require_relative 'common_searchbar'
require_relative 'common_utils'

# Elements on the specific RCSB homepage
class AdvancedSearchPage 
  include PageObject
  include SearchBar
  include CommonPageElements
      
  
  # Dropdowns
	select_list(:query_select_type, :id => "smartSearchSubtype_0")
	
	text_area(:sequence_input_text_area, :id => "sequence_0")
	text_area(:structureids_input_text_area, :id => "structureIdList_0")
	
	button(:submit_advanced_query, :id => "doSearch")
	
	# Function to Select the Query Type
	def query_type=(query_option)
      @browser.select_list(:id => "smartSearchSubtype_0").select(query_option)
  end
  
end