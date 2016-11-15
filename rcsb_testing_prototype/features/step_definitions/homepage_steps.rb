Given /^user is on rcsb.org$/ do 
  visit_page(HomePage)
  sleep 0.5
  expect(@browser.url.include?("http://www.rcsb.org")).to be true

  @hp = on_page(HomePage)
  expect(@hp.browser_title).to eq "RCSB Protein Data Bank - RCSB PDB"
end

Header /^I check, the structure count will be displayed$/ do
  # Number is loaded dynamically
  @browser.link(id: "CurrentStructureCount").wait_until_present
  @structure_count = @hp.current_structure_count
  puts "* Structure Count: " + @structure_count
  expect(@structure_count).to be > '123456'
end

When /^a user clicks on the structure count$/ do
  @hp.all_holdings_link
end

And /^I should see the Welcome panel$/ do
  expect(@hp.welcome_panel_title.include?("A Structural View of Biology")).to be true
end

And /^there should be structures in 'Lastest Entries' section$/ do
  @browser.div(:id, "lateststructure").wd.location_once_scrolled_into_view

  # puts "* First Latest Entry: " + @hp.latest_entry_title
  expect(@hp.latest_entry_title.length).to be > 0

  # Should be 10 latest entries in box
  EachLatestStructureList = @browser.div(:id => "carousel-lateststructure").divs(:class => "item")
  expect(EachLatestStructureList.count).to equal(9)
end

And /^there should be data in 'Features & Highlights' section$/ do
  # puts @hp.feature_highlight_title
  expect(@hp.feature_highlight_title.length).to be > 0
end

And /^there should be news in 'News' section$/ do
  # puts @hp.news_titles
  expect(@hp.news_titles.length).to be > 0
end

And /^data should exist in 'PDB at a Glance' section$/ do
  @browser.div(:id, "footer_statistics").wd.location_once_scrolled_into_view
  
  # puts @hp.statistics_footer
  expect(@hp.statistics_footer.length).to be > 0
  # TODO: Check the data whether it's filled for li's
end

When /^I click on various welcome panels$/ do
  @hp.panel_deposit
  expect(@browser.url.include?("#Category-deposit")).to be true
  expect(@hp.deposit_panel_title).to eq "Deposition Preparation Tools"

  @hp.panel_search
  expect(@browser.url.include?("#Category-search")).to be true
  expect(@hp.search_panel_title).to eq "Explore the PDB Archive"

  @hp.panel_visualize
  expect(@browser.url.include?("#Category-visualize")).to be true
  expect(@hp.visualize_panel_title).to eq "3D Structure Viewers"
end

When /^I click on the Search Panel Subnavigation$/ do
  @hp.panel_search
  expect(@browser.url.include?("#Category-search")).to be true
  expect(@hp.search_panel_title).to eq "Explore the PDB Archive"
end

And /^I click on the Homo Sapien category$/ do
  sleep 0.5
  @browser.div(id: "pieChartDiv_0").wait_until_present

  @homosapien_link = @hp.organism_table_element[0][1].text
  puts @homosapien_link
  @homosapien_count = @homosapien_link.delete("Homo sapiens ").delete('()')
  # puts @homosapien_count
  expect(@homosapien_link.include?("Homo sapiens")).to be true

  # Click on Homo Sapien link
  @browser.div(:id, "pieChartDiv_0").table.row(:index => 0).cell(:index => 1).link.click
end

When /^I click on Molecule of the Month image$/ do       
  # puts @hp.molecule_title
  @motm_title = @hp.molecule_title
  # @motm_title = "Isoprene Synthase"
  # puts @browser.div(:id => "HomepageMoleculeOfTheMonth").h5.text
  # puts @hp.molecule_month


# http://stackoverflow.com/questions/29304401/watir-webdriver-can-click-element-in-chrome-but-not-in-firefox
  # Firefox can't click
  if (@browser.driver.browser.to_s.downcase == "firefox")
    puts "firefox can't click"
    
  else 
    @browser.div(:id => "HomepageMoleculeOfTheMonth").image(:alt => "RCSB PDB Molecule of the Month").parent.click
  end
end

# Currently Doesn't work on Firefox
Then /^I should be redirected to PDB101 page$/ do
  expect(@browser.h1.text.include?(@motm_title)).to be true
  expect(@browser.title).to eq "PDB-101: #{@motm_title}"
  expect(@browser.url.include?("http://pdb101.rcsb.org/motm")).to be true

  # puts "Molecule of the Month Title: #{@motm_title}"
  # puts @browser.title 
  # @browser.execute_script('window.history.back();')
end


Given /^I am on https rcsb.org site$/ do 
  @browser_https = Watir::Browser.new :phantomjs
  @browser_https.goto "https://www.rcsb.org"
end

Then /^I should get a empty page$/ do
  @blank_site = "about:blank"
  expect @browser_https.status.nil?
  expect(@browser_https.url.include?(@blank_site)).to be true

  @browser_https.close
end