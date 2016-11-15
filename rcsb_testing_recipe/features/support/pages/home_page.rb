require_relative 'homepage_panel_nav'
require_relative 'common_searchbar'
require_relative 'common_utils'

# Elements on the specific RCSB homepage
class HomePage 
  include PageObject
  include HomepagePanelNav
  include SearchBar
  include CommonPageElements
      
  page_url "http://www.rcsb.org/"
  # page_url "http://nightly.rcsb.org/"
  # page_url "http://release.rcsb.org/"

# PANELS SECTION
  div(:panel_content) {
  	div_element(:id => 'panel_toggle-content').div_element(:class => 'panel_detailcontent')
  }
  
  h3(:welcome_panel_title) {
  	div_element(:id => 'welcome_rcsb_panel').h3_element
  }

  image(:molecule_image, :alt => 'RCSB PDB Molecule of the Month')
  
  h3(:deposit_panel_title) {
  	div_element(:id => 'deposit_prepare_panel').h3_element
  }

  div(:deposit_panel_container, :id => 'deposit_prepare_panel')

  h3(:search_panel_title) {
  	div_element(:id => 'search_drilldown_panel').h3_element
  }

  h3(:visualize_panel_title) {
    div_element(:id => 'visualize_3dviewers_panel').h3_element
  }

  link(:organism_table) {
    div_element(:id => 'pieChartDiv_0').table_element
  }
  
  h3(:visualize_panel_title) {
  	div_element(:id => 'visualize_3dviewers_panel').h3_element
  }

  h5(:molecule_title) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h5_element
  }
  
  h4(:molecule_month) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h4_element
  }

# LATEST ENTRIES SECTION
  h3(:latest_entry_title) {
  	div_element(:id => 'carousel-lateststructure').div_element(:class => 'active').h3_element
  }

# LATEST FEATURES & HIGHLIGHTS
  h4(:feature_highlight_title) {
  	div_element(:id => 'newfeatures').div_element(:class => 'panel-body').h4_element
  }
    
# LATEST NEWS
  h4(:news_titles) {
  	list_item_element(:id => 'weeklyRCSBnews').h4_element
  }
  
# FOOTER STATISTICS
  p(:statistics_footer) {
  	div_element(:id => 'footer_statistics').list_item_element
  }


end