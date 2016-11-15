# SELECTION LIST VALUE
And (/^select option with "([^"]*)" "([^"]*)" in dropdown with "([^"]*)" "([^"]*)"$/) do |option_type, option_value, select_selector_type, select_selector_name|

	# puts "#{option_value}"
	@option_value = "#{option_value}"
	@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").select_value(@option_value)
end

# CHECKBOX
And (/^in section "([^"]*)" "([^"]*)", checkbox with "([^"]*)" "([^"]*)", mark as "([^"]*)"$/) do |section_selector_type, section_name, checkbox_selector_type, checkbox_selector_name, checked|
	@checkbox_focused = @browser.element(:"#{section_selector_type}" => "#{section_name}").checkbox(:"#{checkbox_selector_type}" => "#{checkbox_selector_name}")
	if "#{checked}" == "checked"
		@checkbox_focused.set
	else
		@checkbox_focused.clear
	end	
end	

# RADIO BUTTON
And (/^in section "([^"]*)" "([^"]*)", select radio button with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, radio_selector_type, radio_selector_name|
	@browser.element(:"#{section_selector_type}" => "#{section_name}").radio(:"#{radio_selector_type}" => "#{radio_selector_name}").set
end	

# TEXT INPUT
And (/^fill in text input "([^"]*)" "([^"]*)" with "([^"]*)"$/) do |input_selector_type, input_selector_name, input_value|
	# Make sure smartMain table cell is present
	if @browser.url.include? "advSearch.do"
    @browser.td(:class => 'smartMain').wait_until_present
  end 

	@text_value = "#{input_value}"
	puts @text_value

	@browser.textarea(:"#{input_selector_type}" => "#{input_selector_name}").set(@text_value)
end

# BUTTON
And (/^click on button with "([^"]*)" "([^"]*)"$/) do |button_selector_type, button_selector_name|
  @browser.button(:"#{button_selector_type}" => "#{button_selector_name}").click
end

# BUTTON - ON MULTIPLE FORM
And (/^in section "([^"]*)" "([^"]*)", click on button with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, button_selector_type, button_selector_name|
	@browser.element(:"#{section_selector_type}" => "#{section_name}").element(:"#{button_selector_type}" => "#{button_selector_name}").click
end	