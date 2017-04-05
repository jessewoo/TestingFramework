require 'watir'
require "watir/wait"
require "open-uri"
require "net/http"

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

# Variables used to count pass, fail, skipped, scenario count
$passed = 0
$failed = 0
$undefined = 0
$scenario_count = 0

# Open a new browser before execution
Before do
  @browser = browser
  @browser.window.resize_to(1280, 780)
end

After do |scenario|
	if scenario.status.to_s == "passed"
    $passed = $passed + 1
  elsif scenario.status.to_s == "failed"
    $failed = $failed + 1
  elsif scenario.status.to_s == "undefined"
    $undefined = $undefined + 1
  end
  $scenario_count = $scenario_count + 1

  # Take screenshot of failed scenario
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end

  browser.cookies.clear

end

AfterConfiguration do |config|
  puts "++++++++++\n\n"
  puts "Features located in the directory: #{config.feature_dirs} \n\n"

  if ENV['TIME']
    puts "NOTE: if cucumber tests are ran thru .sh file thru '/start_here/cloud/logs/' - log file named: " + ENV['TIME'] + "_output.log"
    puts "NOTE: if cucumber tests are ran thru terminal window in '/features/logs/' - log file named: " + ENV['TIME'] + "_output.log"
  end
  puts "\n\n++++++++++\n\n"
end

at_exit do
    browser.close

    puts "\n++++++++++\n"
    puts "Scenarios Total: #{$scenario_count}"
    if $passed > 0
      puts "Passed: #{$passed}"
    end
    if $failed > 0
      puts "Failed: #{$failed}"
    end
    if $undefined > 0
      puts "Undefined: #{$undefined}"
    end
    puts "++++++++++\n\n"

    if $failed > 0
      puts "FAIL"
    else
      puts "PASS"
    end
    puts "\n++++++++++\n\n"

end