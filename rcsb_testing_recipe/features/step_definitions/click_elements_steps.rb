And (/^click on image with "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|
  # Image wrapped in an anchor tag
  @browser.image(:"#{selector_type}" => "#{selector_name}").parent.click
end

And (/^in section "([^"]*)" "([^"]*)", click on link with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name|

  @link_location = @browser.div(:"#{section_selector_type}" => "#{section_name}").link(:"#{selector_type}" => "#{selector_name}")
  # puts @link_location.wait_until(&:present?).text
  @link_location.wait_until(&:present?).click

  if "#{section_name}".downcase.include? "homepage_panelslides"
    expect(@browser.url.include?("#{selector_name}")).to be true
  else
    # puts @browser.url
  end
end

And (/^in section "([^"]*)" "([^"]*)", click on carousel arrow with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name|

  @link_location = @browser.div(:"#{section_selector_type}" => "#{section_name}").link(:"#{selector_type}" => "#{selector_name}")
  #    Reset the "click" of left arrow
  sleep 1
  @link_location.wait_until(&:present?).click

end

# Regex to find text
And (/^in section "([^"]*)" "([^"]*)", click on link that containing text "([^"]*)"$/) do |section_selector_type, section_name, link_text|
  @browser.div(:"#{section_selector_type}" => "#{section_name}").link(:text => /#{link_text}/).click
end

And (/^click on link with "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|
  @browser.link(:"#{selector_type}" => "#{selector_name}").click
end