require_relative 'common_searchbar'
require_relative 'common_utils'
require_relative 'structure_page_common'

# Elements on the specific RCSB structure summary page
class Structure3DPage
  include PageObject
  include SearchBar
  include CommonPageElements
  include StructurePageCommon
  
  div(:jmol_applet, :id => "jmolApplet0_appletinfotablediv")

  # Display Mode
  button(:secondary_structure_button) {
  	div_element(:id => 'DisplayMode').button_element(:id => 'jmolReset')
  }

  button(:subunit_button) {
  	div_element(:id => 'DisplayMode').button_element(:id => 'chains')
  }

  button(:symmetry_button) {
  	div_element(:id => 'DisplayMode').button_element(:id => 'symmetryview')
  }

  p(:pointgroup_value, :id => 'pointgroupdetail')
  p(:stoichiometry_value, :id => 'stoichiometrydetail')

  # Dropdown for Bio Display
	select_list(:select_bioassembly, :id => "changebioldisplay")

  # Diplay Option: Style
	select_list(:select_style, :id => "groupA")

	# Display Option: Color
	select_list(:select_color, :id => "group2")

	# Display Option: Surface
	select_list(:select_surface, :id => "group3")

	# Select a Viewer
	select_list(:select_viewer, :id => "jmolModeSelect")

		# Function to select the View Options
	def viewer_options=(viewer_options)
      @browser.select_list(:id => "jmolModeSelect").select(viewer_options)
  end


  # NGL Related Selections
	select_list(:ngl_select_assembly, :id => "assemblySelect")
	select_list(:ngl_select_model, :id => "modelSelect")
	select_list(:ngl_select_symmetry, :id => "symmetrySelect")
	select_list(:ngl_select_interaction, :id => "interactionSelect")
	select_list(:ngl_select_style, :id => "styleSelect")
	select_list(:ngl_select_color, :id => "colorSchemeSelect")
	select_list(:ngl_select_ligand, :id => "ligandStyleSelect")
	select_list(:ngl_select_ligand, :id => "qualitySelect")

end