And (/^search for "([^"]*)" with match type "([^"]*)"$/) do |search_term, search_match_type|

  if search_match_type == 'phrase'
    @browser.text_field(:id => "autosearch_SearchBar").set "\"#{search_term}\""
  else
    @browser.text_field(:id => "autosearch_SearchBar").set "#{search_term}"
  end

  @browser.button(:id => 'searchbutton').click

  # If PDB ID, should be redirected to Structure Summary Page
  if ("#{search_term}" =~ /^[0-9][a-zA-Z0-9]{3}$/)
    # puts "Structure Summary Page"
    expect(on_page(StructureSummaryPage).structure_pdbid).to eq "#{search_term}"
    expect(@browser.title.include?("#{search_term}")).to be true
    expect(@browser.url.include?("#{search_term}")).to be true
    expect(@browser.url.include?("explore/explore.do")).to be true
  else
    sleep 0.5
    @browser.element(:id => "SearchParameterText").wait_until_present
    expect(on_page(SearchResultsPage).search_response.include?("#{search_term}".downcase)).to be true
  end
end


And /^list out the total number of search results$/ do
  @totalresults = @browser.span(:id => "getResultSizeValue").text
  puts @totalresults
end

# Index 0 = is the header
And (/^in the search results table, select the row with index "([^"]*)"$/) do |row_index|
  @SearchResults_Table = @browser.table(:id => "SearchResultsTable-MainContent")
  if row_index == 0
    puts "Header Selected, have an index > 0"
  else
    @checkbox = @SearchResults_Table["#{row_index}".to_i][0].checkbox(:class => "checkboxPDBSearchResults")
    # Set the Checkbox
    @checkbox.set
    @PDBId = @checkbox.value
    puts "PDB ID: " + @PDBId + " | Selected? " + (@checkbox.set?).to_s
  end
end

# PDB ID
And (/^in the search results table, select the row with PDB ID value "([^"]*)"$/) do |pdbid|
  @SearchResults_Table = @browser.table(:id => "SearchResultsTable-MainContent")

  @checkbox = @SearchResults_Table.checkbox(:value => "#{pdbid}")
  @checkbox.set
  puts "PDB ID: #{pdbid} | Selected? " + (@checkbox.set?).to_s
end

And (/^in the search results list, select the row with PDB ID value "([^"]*)"$/) do |pdbid|
  @SearchResults_List = @browser.ul(:id => "SearchResultsDetails-MainContent")

  @checkbox = @SearchResults_List.checkbox(:value => "#{pdbid}")
  @checkbox.set
  puts "PDB ID: #{pdbid} | Selected? " + (@checkbox.set?).to_s
end