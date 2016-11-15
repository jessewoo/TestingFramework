And (/^check element by "([^"]*)" "([^"]*)", value "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name, num_operator, num_value|

  if "#{selector_type}" == "href"
    @element_value = @browser.link(:href => "#{selector_name}").text.gsub(/\D/, '')
  else
    @element_value = @browser.element(:"#{selector_type}" => "#{selector_name}").text.gsub(/\D/, '')
  end

  if "#{num_operator}" == '>'
    expect(@element_value).to be > "#{num_value}"
  elsif "#{num_operator}" == '<'
    expect(@element_value).to be < "#{num_value}"
  else
    expect(@element_value).to eq "#{num_value}"
  end

end

And (/^check element by "([^"]*)" "([^"]*)", content contains "([^"]*)"$/) do |selector_type, selector_name, content|

  @browser.element(:"#{selector_type}" => "#{selector_name}").wait_until_present  
  @element_content = @browser.element(:"#{selector_type}" => "#{selector_name}").text
  # puts @element_content

  expect(@element_content.downcase.include?("#{content}".downcase)).to be true
end