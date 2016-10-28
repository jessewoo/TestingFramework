require_relative 'common_searchbar'
require_relative 'common_utils'

# Elements on the specific RCSB homepage
class ReportsPage 
  include PageObject
  include SearchBar
  include CommonPageElements    
	
  h3(:report_title) {
  	div_element(:id => 'maincontentcontainer').div_element(:index => 0).h3_element
  }
end