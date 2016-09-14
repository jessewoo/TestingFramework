Given /^I am on the rcsb.org site$/ do 
  visit_page(HomePage)
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

Then /^I should be redirected to PDB101 page$/ do
  @browser.h4(:text => "Molecule of the Month") 
end