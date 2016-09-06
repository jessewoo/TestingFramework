require 'watir-webdriver'

# Run before each test, creating the browser object
Before do
  @browser = Watir::Browser.new :chrome
end


After do
  @browser.close
end