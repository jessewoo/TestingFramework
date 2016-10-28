When(/^they search for "([^"]*)"$/) do |arg|
  # Start from Homepage Search Bar
  @hp.search_bar = "#{arg}"
  @search_term = "#{arg}"
  @hp.search_button
end

# Load All structures
Then /^user should be shown All Structures$/ do
  sleep 1.0
  @srp = on_page(SearchResultsPage)

  @browser.kbd.wait_until_present
  expect(@srp.search_response).to eq 'Holdings : All Structures'

  @tab_count = @srp.structure_tab_count.chomp(" Structures").delete(',')
  puts @tab_count + " Structures"
  expect(@srp.current_structure_count).to eq @tab_count
end

def checkSearchResultsMeta
  # Check Browser Title of Search Results Page
  expect(@srp.browser_title.include?("RCSB PDB - Search Results")).to be true

  # Check URL of Search Results Page
  @srp_url = @srp.current_url
  expect(@srp_url.include?("qrid=")).to be true
  expect(@srp_url.include?("tabtoshow=")).to be true
  expect(@srp_url.include?("results.do?")).to be true
end  

# QUERY MULTIPLE PDB IDs
Then(/^RCSB should return specific PDB IDs for "([^"]*)"$/) do |arg|
  @pdbidCount = "#{arg}".split(",").length  
  if @pdbidCount == 1
    puts "On Structure Page: " + on_page(StructureSummaryPage).structure_pdbid
    expect(on_page(StructureSummaryPage).structure_pdbid).to eq "#{arg}"
  else 
    # Thru the Advanced Search Interface
    # SET the variable for Search Results Page
    @srp = on_page(SearchResultsPage)

    # Check Title and URL
    checkSearchResultsMeta

    sleep 0.5
    @pdbidCountString = @pdbidCount.to_s + " IDs"
    # puts "On Search Results Page: " + @srp.search_response

    # Check the Arguments
    expect(@srp.search_response.include?("#{arg}")).to be true
    expect(@srp.search_response.include?(@pdbidCountString)).to be true
    expect(@srp.search_response.include?("Simple query for a list of PDB IDs")).to be true
  end
end

# QUERY MULTIPLE PDB IDs
Then(/^RCSB should return drilldown results for "([^"]*)"$/) do |arg|
  @srp = on_page(SearchResultsPage)

  # Check Title and URL
  checkSearchResultsMeta

  sleep 0.5
  # puts "On Search Results Page after Drilldown: " + @srp.search_response

  # Check the Arguments
  expect(@srp.search_response.include?("#{arg}")).to be true

  @tab_count_homosapien = @srp.structure_tab_count.chomp(" Structures").delete(',')
  expect(@homosapien_count).to eq @tab_count_homosapien
end


# QUERY MULTIPLE SEARCHES
Then(/^RCSB should return results for "([^"]*)"$/) do |arg|
  # If search term matches PDB ID Regular Expression Pattern
  if ("#{arg}" =~ /^[0-9][a-zA-Z0-9]{3}$/)
    # puts "On Structure Page: " + on_page(StructureSummaryPage).structure_pdbid
    expect(on_page(StructureSummaryPage).structure_pdbid).to eq "#{arg}"
  else 
    # CONDITION - if NOT PDB ID
    # puts @search_term
    expect(@search_term.include?("#{arg}")).to be true

    # SET the variable for Search Results Page
    @srp = on_page(SearchResultsPage)

    # Check Title and URL
    checkSearchResultsMeta

    # Simple Text Search - Load by JSON
    sleep 0.5
    # puts @srp.search_response
    expect(@srp.search_response.include?(@search_term)).to be true

    puts @srp.structure_tab_count.chomp(" Structures").delete(',') + " [" + @search_term + "] Related Structures"
  end    

end

And(/^user can filter results related to "([^"]*)"$/) do |arg|
  # Default view is Detailed, change the view to Tabular
  @srp.view_options = "Tabular"
  sleep 0.25
  expect(@srp.current_url.include?("tabtoshow=condensed")).to be true
  # @srp.screenshot = "Tabular"
  
  # Change the view to Gallery
  @srp.view_options = "Gallery"
  sleep 0.25
  expect(@srp.current_url.include?("tabtoshow=gallery")).to be true
  # @srp.screenshot = "Gallery"

  # Go back to view to Detailed 
  @srp.view_options = "Detailed"
  sleep 0.25
  expect(@srp.current_url.include?("tabtoshow=Current")).to be true
  
  # Try out Next Page option
  @srp.next_Page
  sleep 0.25
  expect(@srp.current_url.include?("gotopage=")).to be true
  # on_page(SearchResultsPage).screenshot = "NextPage"
end


And(/^user can view other tabs related to "([^"]*)"$/) do |arg|
# Unreleased Tab
  @srp.unreleased_tab
  @unreleased_browser_url = @srp.current_url
  # puts @unreleased_browser_url
  # @srp.screenshot = "Unreleased"
  expect(@unreleased_browser_url.include?("tabtoshow=Unreleased")).to be true

# Citation Tab
  @srp.citation_tab
  @citation_browser_url = @srp.current_url
  # puts @citation_browser_url
  # @srp.screenshot = "Citation"
  expect(@citation_browser_url.include?("tabtoshow=Citation")).to be true

# Ligands Tab
  @srp.ligand_tab
  @ligand_browser_url = @srp.current_url
  # puts @ligand_browser_url
  # @srp.screenshot = "Ligand"
  expect(@ligand_browser_url.include?("tabtoshow=Ligand")).to be true

# Content Tab
  sleep 0.5
  @srp.content_tab
  @content_browser_url = @srp.current_url
  # puts @content_browser_url
  # @srp.screenshot = "Content"
  expect(@content_browser_url.include?("tabtoshow=content")).to be true

end

And /^user can select some of the PDBIDs$/ do
  @srp.uncheck_toggle_search_results
  
  @Unordered_List_SearchResults = @browser.ul(:id => "SearchResultsDetails-MainContent")
  @EachSearchResultsList = @Unordered_List_SearchResults.lis(:class => "oneSearchResult")

  @firstcheckbox = @EachSearchResultsList[0].checkbox(:class => "checkboxPDBSearchResults")
  @firstPDBId = @firstcheckbox.value
  @browser.li(:id, "result_pdb" + @firstPDBId).wd.location_once_scrolled_into_view
  @browser.li(:id, "result_pdb" + @firstPDBId).checkbox(:value => @firstPDBId).set
  puts "PDB ID: " + @firstPDBId + " | Selected? " + (@firstcheckbox.set?).to_s
  
  @thirdcheckbox = @EachSearchResultsList[2].checkbox(:class => "checkboxPDBSearchResults")
  @thirdPDBId = @thirdcheckbox.value
  @browser.li(:id, "result_pdb" + @thirdPDBId).wd.location_once_scrolled_into_view
  @browser.li(:id, "result_pdb" + @thirdPDBId).checkbox(:value => @thirdPDBId).set
  puts "PDB ID: " + @thirdPDBId + " | Selected? " + (@thirdcheckbox.set?).to_s
end

And /^user can download some of the PDBIDs$/ do
  # Go to the Header
  @browser.div(:id, "header").wd.location_once_scrolled_into_view
  @srp.downloadButton
end

And /^user is on the batch download page$/ do
  @dlp = on_page(DownloadPage)
  puts @dlp.current_url
  expect(@dlp.current_url.include?("qrid=")).to be true
  expect(@dlp.current_url.include?("download.do")).to be true
  expect(@dlp.current_url.include?("doQueryIds=getchecked")).to be true
  
  # Headless doesn't show text area values
  if (@browser.driver.browser.to_s.downcase == "chrome")
      sleep 0.5
      puts "Structure Ids " + @dlp.structureId_textarea
      # puts "Sequence Ids " + on_page(DownloadPage).sequenceId_textarea
      # puts "Ligand Ids " + on_page(DownloadPage).ligand_textarea
      expect(@dlp.structureId_textarea.include?(@firstPDBId + ", " + @thirdPDBId)).to be true
  end
  
end

And /^user go back to search results page$/ do
  @browser.back
  puts @srp.current_url
end

And /^user can generate a structure report$/ do
  # CHECK TO SEE IF BROWSER IS CHROME
  # (@browser.driver.browser.to_s.downcase == "chrome")
  
  @srp.report_options = "Structure"
  sleep 0.5
  
  @rp =  on_page(ReportsPage)
  puts @rp.current_url

  expect(@rp.current_url.include?("qrid=")).to be true
  expect(@rp.current_url.include?("gridReport.do")).to be true
  expect(@rp.current_url.include?("reportTitle=structureSummary")).to be true
  expect(@rp.report_title.include?("Structure Summary Report")).to be true
  
end
