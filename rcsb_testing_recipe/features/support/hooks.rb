require 'watir-webdriver'
require "watir-webdriver/wait"

# EXAMPLE: cucumber CHROME=true features/basic_test_suite.feature
if ENV['CHROME'] then
  # Installed Lastest Chrome Driver 2.25
  browser = Watir::Browser.new :chrome
  INDEX_OFFSET = -1
  WEBDRIVER = true  

elsif ENV['FIREFOX'] then
  # Installed Gecko Driver 11.1
  browser = Watir::Browser.new :firefox
  INDEX_OFFSET = -1
  WEBDRIVER = true 

else
	# Headless using Phantom JS - Default
  browser = Watir::Browser.new :phantomjs
  INDEX_OFFSET = 0
  WEBDRIVER = false
end

# Code for each scenario before execution
Before do 
  @browser = browser
  @browser.window.resize_to(1280, 780)
end

# After each SCENARIO is executed
After do
  # sleep 3.0
end

# puts File.dirname(__FILE__)
$passed = 0
$failed = 0
$undefined = 0
$scenario_count = 0 

After do |scenario|
	if scenario.status.to_s == "passed"
    $passed = $passed + 1
  elsif scenario.status.to_s == "failed"
    $failed = $failed + 1
    puts "FAILED SCENARIO!"
  elsif scenario.status.to_s == "undefined"
    $undefined = $undefined + 1
  end
  $scenario_count = $scenario_count + 1

  if scenario.failed?
  	# Take screenshot of failed scenario
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

  browser.cookies.clear
end

at_exit do
    browser.close

    puts "++++++++++" 
    puts "Total Number of Scenarios: #{$scenario_count}"
    if $passed > 0
      puts "Passed: #{$passed}"
    end
    if $failed > 0
      puts "Failed: #{$failed}" 
    end
    if $undefined > 0
      puts "Undefined: #{$undefined}"
    end

    # WRAPPER - Final Statement to continue or review
    if $failed > 0
       puts "\nFAIL"  
    else 
       puts "\nPASS"
    end  
end