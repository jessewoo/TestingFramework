require_relative 'main_nav_panel'
require_relative 'search_bar'

# Elements on the specific RCSB homepage
class HomePage 
  include PageObject
  include MainNavPanel
  include SearchBar
      
  page_url "http://www.rcsb.org/"

  image(:molecule_image, :alt => 'RCSB PDB Molecule of the Month')

  h5(:molecule_title) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h5_element
  }

  h4(:month_title) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h4_element
  }


end