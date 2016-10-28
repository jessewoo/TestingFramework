Then(/^RCSB should show structure summary page for "([^"]*)"$/ ) do |arg|
  @ssp = on_page(StructureSummaryPage)
  @pdbid = @ssp.structure_pdbid
  
  expect(@ssp.structure_pdbid.include?("#{arg}".upcase)).to be true
  
  # Check URL
  expect(@ssp.current_url.include?("structureId=" + "#{arg}")).to be true
  expect(@ssp.current_url.include?("explore.do?")).to be true

  expect(@ssp.structure_title.length).to be > 0

  puts "* Data Retrieved: " + @ssp.structure_pdbid + " | " + @ssp.structure_title
end

And /^there should be a data in methods section$/ do 
  @browser.div(:id, "experimentaldata-validation").wd.location_once_scrolled_into_view
  expect(@ssp.experimental_data_method.length).to be > 0
end

And /^there should be a carousel gallery section$/ do 
  expect(@ssp.active_carousel_ngl).to eq "NGL"

  # NMR vs. Other Methods
  if @ssp.experimental_data_method.include?("NMR")
    expect(@ssp.active_carousel_header).to include("NMR Ensemble")
  else
    expect(@ssp.active_carousel_header).to include("Biological Assembly 1")
  end
end

And /^there should be a macromolecule data section$/ do 
  @browser.div(:id, "macromoleculespanel").wd.location_once_scrolled_into_view
  expect(@ssp.macromolecule_classification.length).to be > 0
end

And /^there should be a data in literature section$/ do 
  expect(@ssp.literature_title.length).to be > 0
end

And /^there should be a data in deposit section$/ do 
  @browser.div(:id, "entry-history").wd.location_once_scrolled_into_view
  expect(@ssp.deposited_date.length).to be > 0
end

And /^there should be a data in small molecule section$/ do 

  if !@ssp.experimental_data_method.include?("NMR")
    @browser.div(:id, "ligandspanel").wd.location_once_scrolled_into_view
    expect(@ssp.small_molecules_table.length).to be > 0
    # puts @ssp.small_molecules_table
  end
end

Then /^user click on the 3D View tab$/ do 
  on_page(StructureSummaryPage).tab_3d
  
  # TIME ELAPSED - time in and time out
  @timeStartJmol = Time.now
end

And(/^user should see the Jmol page for the "([^"]*)"$/ ) do |arg|
  @viewpage = on_page(Structure3DPage)
  expect(@viewpage.current_url.include?("structureId=" + "#{arg}")).to be true
  expect(@viewpage.current_url.include?("jmol.do?")).to be true
  
  @browser.div(:id => 'jmolApplet0_appletinfotablediv').wait_until_present

  @timeEndJmol = Time.now
  @timeElapsedJmol = @timeEndJmol - @timeStartJmol
  puts "**** Time Elapsed for JSmol Loading: " + @timeElapsedJmol.to_s + " sec"

  expect(@viewpage.structure_pdbid.include?("#{arg}".upcase)).to be true

end


Then /^user can change the Jmol view of the 3D structure$/ do 
  
  puts @viewpage.select_bioassembly_options
  puts @viewpage.select_style_options
  puts @viewpage.select_color_options
  puts @viewpage.select_surface_options
  puts @viewpage.select_viewer_options


end

And(/^user selects the NGL view for "([^"]*)"$/ ) do |arg|

  # TIME ELAPSED - time in and time out
  @timeStartNGL = Time.now
  @viewpage.viewer_options = "NGL (WebGL)"

  expect(@viewpage.current_url.include?("ngl/ngl.do?pdbid=" + "#{arg}")).to be true

  @browser.div(:id => 'stageViewport').wait_until_present

  @timeEndNGL = Time.now
  @timeElapsedNGL = @timeEndNGL - @timeStartNGL
  puts "**** Time Elapsed for NGL Loading: " + @timeElapsedNGL.to_s + " sec"


  puts @viewpage.ngl_select_assembly_options
  puts @viewpage.ngl_select_model_options
  puts @viewpage.ngl_select_symmetry_options
  puts @viewpage.ngl_select_interaction_options
  puts @viewpage.ngl_select_style_options
  puts @viewpage.ngl_select_color_options
  puts @viewpage.ngl_select_ligand_options
  puts @viewpage.ngl_select_ligand_options


# Moving cursor around
# http://chariotsolutions.com/blog/post/automated-testing-of-html5-canvas/
  element = @browser.driver.find_element(:tag_name, 'canvas')
  @browser.driver.action.move_to(element, 10, 10).perform
  sleep 1
  @browser.driver.action.move_to(element, 100, 100).perform
  sleep 1
  @browser.driver.action.move_to(element, 500, 500).perform
  sleep 1
  @browser.driver.action.move_to(element, 1000, 1000).perform


end