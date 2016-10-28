Given /^Admin is on the rcsb.org status page$/ do 
	@browser.goto "http://www.rcsb.org/pdb/status.do"
end

Then /^Admin should see server response$/ do
  
  expect(@browser.text.include?("Status : Available")).to be true
  if @browser.text.include?("Status : Updating")
  	puts "Status - Updating"
  elsif @browser.text.include?("Status : Pulled")
  	puts "Status - Pulled"
  else
  	puts "Status - Available"	
  end	

end


Given /^Admin is on the rcsb.org summary json page$/ do 
	@browser.goto "http://www.rcsb.org/pdb/json/summary.do?tabtoshow=Current"
end


Then /^Admin should see homo sapiens data$/ do
  
 

end