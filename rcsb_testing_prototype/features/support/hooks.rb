require 'watir-webdriver'

Before do
  	# @browser = Watir::Browser.new :phantomjs
  @browser = Watir::Browser.new :chrome

  # Set the window size - full screen
  	@browser.window.resize_to(1280, 720)
end

After do
  	@browser.close
end