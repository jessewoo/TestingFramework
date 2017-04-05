# SELECTION LIST VALUE
And (/^select option with "([^"]*)" "([^"]*)" in dropdown with "([^"]*)" "([^"]*)"$/) do |option_type, option_value, select_selector_type, select_selector_name|
	@option_value = "#{option_value}"
  if option_type == "value"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").select_value(@option_value)
  elsif option_type == "text"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").option(:text, @option_value).select
	elsif option_type == "id"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").option(:id, @option_value).select
  end
end

# OPTION - SELECTION LIST - WAIT TILL PRESENT
And (/^check option "([^"]*)" "([^"]*)" in select list with "([^"]*)" "([^"]*)" become visible$/) do |option_type, option_value, select_selector_type, select_selector_name|
	@option_value = "#{option_value}"
	if option_type == "value"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").select_value(@option_value)
	elsif option_type == "text"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").option(:text, @option_value).when_present
	elsif option_type == "id"
		@browser.select_list(:"#{select_selector_type}" => "#{select_selector_name}").option(:id, @option_value).when_present
	end
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

# TEXT AREA
And (/^fill in text area "([^"]*)" "([^"]*)" with "([^"]*)"$/) do |input_selector_type, input_selector_name, input_value|
	# Make sure smartMain table cell is present
	if @browser.url.include? "advSearch.do"
    @browser.td(:class => 'smartMain').wait_until_present
  end
	@text_value = "#{input_value}"
	@browser.textarea(:"#{input_selector_type}" => "#{input_selector_name}").set(@text_value)
end

# TEXT FIELD
And (/^fill in text input "([^"]*)" "([^"]*)" with "([^"]*)"$/) do |input_selector_type, input_selector_name, input_value|
	@text_value = "#{input_value}"
	@browser.text_field(:"#{input_selector_type}" => "#{input_selector_name}").set(@text_value)
end

# TEXT INPUT - Wait until a value exists in input field
And (/^wait for text field with "([^"]*)" "([^"]*)", value is equal "([^"]*)"$/) do |input_selector_type, input_selector_name, input_value|
  @input_textfield = @browser.text_field(:"#{input_selector_type}" => "#{input_selector_name}").value
	expect(@input_textfield).to eq "#{input_value}"
end

# BUTTON
And (/^click on button with "([^"]*)" "([^"]*)"$/) do |button_selector_type, button_selector_name|
  @browser.button(:"#{button_selector_type}" => "#{button_selector_name}").click
end

# BUTTON - ON MULTIPLE FORM
And (/^in section "([^"]*)" "([^"]*)", click on button with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, button_selector_type, button_selector_name|
	@browser.element(:"#{section_selector_type}" => "#{section_name}").element(:"#{button_selector_type}" => "#{button_selector_name}").click
end
