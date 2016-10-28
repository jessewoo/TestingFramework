When /^I click on the Advanced Search link underneath Search Bar$/ do
  on_page(HomePage).advanced_search_link
  expect(@browser.title).to eq 'RCSB PDB - Advanced Search'
end


And(/^I search by multiple Pdb Ids of "([^"]*)"$/) do |arg|
  @browser.select_list(:id => 'smartSearchSubtype_0').select_value("StructureIdQuery")
  sleep 0.5
  @browser.td(:class => 'smartMain').wait_until_present
  on_page(AdvancedSearchPage).structureids_input_text_area = "#{arg}"
  on_page(AdvancedSearchPage).submit_advanced_query_element.click

end

And /^I insert Human sequence for sequence search$/ do

  puts @browser.url
  # on_page(AdvancedSearchPage).query_type = "SequenceQuery"
  @browser.select_list(:id => 'smartSearchSubtype_0').select_value("SequenceQuery")
    
  # Wait for the unit to load
  # sleep 1 until @browser.text_area(:id, 'sequence_0').exists?
  @browser.td(:id => 'smartSearchDesc_0').wait_until_present
  
  @human_sequence = 'MGPWGWKLRWTVALLLAAAGTAVGDRCERNEFQCQDGKCISYKWVCDGSAECQDGSDESQ 
  ETCLSVTCKSGDFSCGGRVNRCIPQFWRCDGQVDCDNGSDEQGCPPKTCSQDEFRCHDGK 
  CISRQFVCDSDRDCLDGSDEASCPVLTCGPASFQCNSSTCIPQLWACDNDPDCEDGSDEW 
  PQRCRGLYVFQGDSSPCSAFEFHCLSGECIHSSWRCDGGPDCKDKSDEENCAVATCRPDE 
  FQCSDGNCIHGSRQCDREYDCKDMSDEVGCVNVTLCEGPNKFKCHSGECITLDKVCNMAR 
  DCRDWSDEPIKECGTNECLDNNGGCSHVCNDLKIGYECLCPDGFQLVAQRRCEDIDECQD 
  PDTCSQLCVNLEGGYKCQCEEGFQLDPHTKACKAVGSIAYLFFTNRHEVRKMTLDRSEYT 
  SLIPNLRNVVALDTEVASNRIYWSDLSQRMICSTQLDRAHGVSSYDTVISRDIQAPDGLA 
  VDWIHSNIYWTDSVLGTVSVADTKGVKRKTLFRENGSKPRAIVVDPVHGFMYWTDWGTPA 
  KIKKGGLNGVDIYSLVTENIQWPNGITLDLLSGRLYWVDSKLHSISSIDVNGGNRKTILE 
  DEKRLAHPFSLAVFEDKVFWTDIINEAIFSANRLTGSDVNLLAENLLSPEDMVLFHNLTQ 
  PRGVNWCERTTLSNGGCQYLCLPAPQINPHSPKFTCACPDGMLLARDMRSCLTEAEAAVA 
  TQETSTVRLKVSSTAVRTQHTTTRPVPDTSRLPGATPGLTTVEIVTMSHQALGDVAGRGN 
  EKKPSSVRALSIVLPIVLLVFLCLGVFLLWKNWRLKNINSINFDNPVYQKTTEDEVHICH 
  NQDGYSYPSRQMVSLEDDVA'
  on_page(AdvancedSearchPage).sequence_input_text_area = @human_sequence
  on_page(AdvancedSearchPage).submit_advanced_query_element.click
  
end

Then /^I should be redirected to the search results with entity data$/ do
  puts @browser.url
  
  # Search Response
  @search_response = on_page(SearchResultsPage).search_response
  # put @search_response
  
  @Unordered_List_SearchResults = @browser.ul(:id => "SearchResultsDetails-MainContent")
  EachSearchResultsList = @Unordered_List_SearchResults.lis(:class => "oneSearchResult")
  @countSearchResultList = EachSearchResultsList.length
  
  # Save the title into an array for later processing
  TitleList_SearchResults = []
  EachSearchResultsList.each do |list|
    # puts list.div(:class => "col-lg-9").h3.text
    TitleList_SearchResults << list.div(:class => "col-lg-9").h3.text
  end
  
  #Iterate through your array in the same method, to report/visit/etc
  TitleList_SearchResults.each do |title|
    puts "** #{title}"
  end
  
  # @browser.li(:id, "result_pdb" + @thirdPDBId).wd.location_once_scrolled_into_view
  
end

And /^the first result should have an entity comparison$/ do
  # First Sequence Container
  expect(on_page(SearchResultsPage).sequence_container.include?("Score:")).to be true
  expect(on_page(SearchResultsPage).sequence_container.include?("E-value:")).to be true
  expect(on_page(SearchResultsPage).sequence_container.include?("Identities:")).to be true
end

And /^scrolling down, the last result should have an entity comparison$/ do
  # Scroll to the bottom of the page
  @browser.div(:id, "footer_main").wd.location_once_scrolled_into_view
  
  # Should Lazy Load Last Sequence Container  
  sleep 0.5
  @LastSequenceContainer = EachSearchResultsList[@countSearchResultList - 1].div(:class => "col-lg-12").text
  expect(@LastSequenceContainer.include?("Score:")).to be true
  expect(@LastSequenceContainer.include?("E-value:")).to be true
  expect(@LastSequenceContainer.include?("Identities:")).to be true

end
