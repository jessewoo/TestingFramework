require_relative 'main_nav_panel'

class HomePage 
  include PageObject
  include MainNavPanel
      
  page_url "http://www.rcsb.org/"

  link(:molecule_link, :id => "HomepageMoleculeOfTheMonth")
  image(:molecule_image, :alt => 'RCSB PDB Molecule of the Month')
  h5(:molecule_title, :id => 'an_id')

    
end