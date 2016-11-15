# START A NEW BROWSER
Given (/^connect to "([^"]*)"$/) do |url|
  @browser.goto "#{url}"
  Watir::Wait.until { @browser.html.length > 0 }
  expect(@browser.url.include?("#{url}")).to be true
end

# CHECK BROWSER PROPERTIES
And (/^check, browser "([^"]*)" contains "([^"]*)"$/) do |property, statement|
  
  # Takes into consideration of target="_blank"
  @browser.windows.last.use

  # Browser title
  if "#{property}" == "title"
    expect(@browser.title.include?("#{statement}")).to be true
    sleep 0.5
  end   

  # Browser URL
  if "#{property}" == "url"
    expect(@browser.url.include?("#{statement}")).to be true
    sleep 0.5
  end
  
end