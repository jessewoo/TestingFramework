require_relative 'common_searchbar'
require_relative 'common_utils'
require_relative 'structure_page_common'

# Elements on the specific RCSB structure summary page
class StructureSummaryPage 
  include PageObject
  include SearchBar
  include CommonPageElements
  include StructurePageCommon
  
  p(:active_carousel_header) {
  	div_element(:class => 'carousel-inner').div_element(:class => 'active').div_element(:class => 'carousel-header')
  }
  
  span(:active_carousel_ngl) {
  	div_element(:class => 'carousel-inner').div_element(:class => 'active').div_element(:class => 'carousel-footer').span_element(:index => 0)
  }
  
  h4(:literature_title) {
  	div_element(:id => 'literaturepanel').div_element(:id => 'primarycitation').h4_element
  }
  
  p(:macromolecule_classification) {
  	div_element(:id => 'macromoleculespanel').paragraph_element(:index => 0).link_element
  }
  
  p(:small_molecules_table) {
  	div_element(:id => 'ligandspanel').table_element.first_row
  }

  p(:experimental_data_method) {
  	unordered_list_element(:id => 'experimentaldatabottom').list_item_element(:index => 0)
  }
  
  p(:deposited_date) {
  	div_element(:id => 'entry-history').unordered_list_element(:class => 'experimentaldata').list_item_element(:index => 0)
  }

end