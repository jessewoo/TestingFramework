require_relative 'main_nav_panel'

class HomePage 
  include PageObject
  include MainNavPanel
      
  page_url "http://www.rcsb.org/"

  image(:molecule_image, :alt => 'RCSB PDB Molecule of the Month')

  # h5(:molecule_title, identifier = {"#{HomepageMoleculeOfTheMonth}_element h5"}.text
  # h5_title = div(:id => "HomepageMoleculeOfTheMonth").h5.text

  h5(:molecule_title) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h5_element
  }

  h4(:month_title) {
  	div_element(:id => 'HomepageMoleculeOfTheMonth').h4_element
  }



end