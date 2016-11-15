And /^go back$/ do
  @browser.execute_script('window.history.back();')
  Watir::Wait.until { @browser.html.length > 0 }
end

And /^wait$/ do
  # Takes into consideration of target="_blank"
  sleep 5
end

And (/^wait for element "([^"]*)" with "([^"]*)" "([^"]*)" to appear$/) do |element_type, input_selector_type, input_selector_name|

	if "#{element_type}" == "textarea"
		@browser.text_field(:"#{input_selector_type}" => "#{input_selector_name}").wait_until_present
	else
		@browser.element(:"#{input_selector_type}" => "#{input_selector_name}").wait_until_present
	end	

end

And (/^scroll to element "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|
	@browser.element(:"#{selector_type}" => "#{selector_name}").wd.location_once_scrolled_into_view
end

And (/^take screenshot of "([^"]*)"$/) do |filename|
	@browser.screenshot.save 'screenshots/screenshot_' + "#{filename}" + '.png'
end

