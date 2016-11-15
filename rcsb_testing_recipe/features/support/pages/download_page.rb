require_relative 'common_searchbar'
require_relative 'common_utils'

# Elements on the specific RCSB homepage
class DownloadPage 
  include PageObject
  include SearchBar
  include CommonPageElements    
	
  text_area(:structureId_textarea) {
	  div_element(:id => 'download_structures_panel').text_area_element
  }
  
  text_area(:sequenceId_textarea) {
	  div_element(:id => 'download_sequences_panel').text_area_element
  }
	
  text_area(:ligand_textarea, :id => 'ligandIdList')
  
end