# START A NEW BROWSER
Given (/^connect to "([^"]*)"$/) do |url|
  # Connection using argument from command lines
  if "#{url}" == "ENV['URL']"
    puts "URL: " + ENV['URL']
    @browser.goto ENV['URL']
    Watir::Wait.until { @browser.html.length > 0 }
    expect(@browser.url.include?(ENV['URL'])).to be true
  else
    @browser.goto "#{url}"
    Watir::Wait.until { @browser.html.length > 0 }
    expect(@browser.url.include?("#{url}")).to be true
  end
end

Given (/^connect to "([^"]*)", redirected to "([^"]*)"$/) do |url,redirect_url|
  @browser.goto "#{url}"
  Watir::Wait.until { @browser.html.length > 0 }
  expect(@browser.url.include?("#{redirect_url}")).to be true
end


Given (/^connect to domain: "([^"]*)", with specific page: "([^"]*)"$/) do |url, specific_page|
  if "#{url}" == "ENV['URL']"
    specific_url = ENV['URL'] + "/" + specific_page
    puts "URL: " + specific_url
    @browser.goto specific_url
  else
    specific_url = url + "/" + specific_page
    @browser.goto specific_url
  end
end

# CHECK BROWSER PROPERTIES
And (/^check, browser "([^"]*)" contains "([^"]*)"$/) do |property, statement|

  # Takes into consideration of target="_blank"
  @browser.windows.last.use

  # Browser title
  if "#{property}" == "title"
    sleep 0.5
    expect(@browser.title.include?("#{statement}")).to be true
  end

  # Browser URL
  if "#{property}" == "url"
    # puts @browser.url
    sleep 0.5
    expect(@browser.url.include?("#{statement}")).to be true
  end
end

# Go to Browser Window
And (/^go to browser window with title: "([^"]*)"$/) do |browser_title|
  @browser.window(:title => "#{browser_title}").use do
    # puts @browser.title
  end
end

# Go to Browser Window
And (/^close browser window with "([^"]*)" contains "([^"]*)"$/) do |browser_property, browser_title|
  @browser.window(:"#{browser_property}" => "#{browser_title}").close do
    # puts @browser.title
  end
end

And /^go back$/ do
  # @browser.execute_script('window.history.back();')
  @browser.back
  Watir::Wait.until { @browser.html.length > 0 }
end
