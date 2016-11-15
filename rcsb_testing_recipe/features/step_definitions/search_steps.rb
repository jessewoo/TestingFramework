And (/^search for "([^"]*)"$/) do |search_term|
  
  @browser.text_field(:id => "autosearch_SearchBar").set "#{search_term}"
  @browser.button(:id => 'searchbutton').click
  @browser.url

  if ("#{search_term}" =~ /^[0-9][a-zA-Z0-9]{3}$/)
    expect(on_page(StructureSummaryPage).structure_pdbid).to eq "#{search_term}"
  else 
    sleep 0.5
    @browser.url

    expect(on_page(SearchResultsPage).search_response.include?("#{search_term}".downcase)).to be true
  end

end