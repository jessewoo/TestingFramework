Given /^I am on the rcsb.org site$/ do 
  visit_page(HomePage)
  puts @browser.url
end

When /^I click on Molecule of the Month image$/ do       
  on_page(HomePage).panel_deposit
  on_page(HomePage).panel_search
  on_page(HomePage).panel_visualize
  on_page(HomePage).panel_analyze
  on_page(HomePage).panel_download
  on_page(HomePage).panel_learn
  on_page(HomePage).panel_welcome

  on_page(HomePage).molecule_link

  # @browser.div(:id => "HomepageMoleculeOfTheMonth").image(:alt => "RCSB PDB Molecule of the Month").parent.click

end

When /^I click on Molecule of the Month image headless$/ do       
  puts on_page(HomePage).molecule_title
  @motm_title = on_page(HomePage).molecule_title
  # @motm_title = "Isoprene xSynthase"

  # puts @browser.div(:id => "HomepageMoleculeOfTheMonth").h5.text
  puts on_page(HomePage).month_title

  @browser.div(:id => "HomepageMoleculeOfTheMonth").image(:alt => "RCSB PDB Molecule of the Month").parent.click
end


Then /^I should be redirected to PDB101 page$/ do
  # Expectations
  expect(@browser.h1.text.include?(@motm_title)).to be true
  puts "Molecule of the Month Title (from variable): #{@motm_title}"

  expect(@browser.url.include?("http://pdb101.rcsb.org/motm")).to be true

  puts @browser.title
  puts @browser.url
end


Given /^I am on https rcsb.org site$/ do 
  @browser_https = Watir::Browser.new :phantomjs
  @browser_https.goto "https://www.rcsb.org"
end

Then /^I should get a empty page$/ do
  puts @browser_https.status
  puts @browser_https.url

  puts @browser_https.browser_network_traffic
  # puts @browser_https.response_headers.to_a

  @browser_https.close
end