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

# To be more specific, which section with that specific image
And (/^in section "([^"]*)" "([^"]*)", check image with "([^"]*)" "([^"]*)" has source containing "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name, image_src|
  @image_src = @browser.element(:"#{section_selector_type}" => "#{section_name}").image(:"#{selector_type}" => "#{selector_name}").src
  # puts @image_src
  expect(@image_src.downcase.include?("#{image_src}".downcase)).to be true
end

# Using CSS, and index value
And (/^check element by "([^"]*)" "([^"]*)" with index "([^"]*)", content contains "([^"]*)"$/) do |selector_type, selector_name, index, content|
  @element_content = @browser.element(:"#{selector_type}" => "#{selector_name}", :index => "#{index}".to_i).text
  expect(@element_content.downcase.include?("#{content}".downcase)).to be true
end

# To be more specific, which section with what index
And (/^in section "([^"]*)" "([^"]*)", check element by "([^"]*)" "([^"]*)" with index "([^"]*)", content contains "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name, index, content|
  @element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").element(:"#{selector_type}" => "#{selector_name}", :index => "#{index}".to_i).text
  expect(@element_content.downcase.include?("#{content}".downcase)).to be true
end

# To be more specific, which section with class
And (/^in section "([^"]*)" "([^"]*)", check element by "([^"]*)" "([^"]*)", content contains "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name, content|
  @element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").element(:"#{selector_type}" => "#{selector_name}").text
  # puts @element_content
  expect(@element_content.downcase.include?("#{content}".downcase)).to be true
end

# EXIST - check if div or other element
And (/^check "([^"]*)" by "([^"]*)" "([^"]*)" exist$/) do |element_type, selector_type, selector_name|
  if "#{element_type}" == 'div'
    @div_exist = @browser.div(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@div_exist).to be true
  elsif "#{element_type}" == 'ul'
    @list_exist = @browser.ul(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@list_exist).to be true
  elsif "#{element_type}" == 'a'
    @link_exist = @browser.link(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@list_exist).to be true
  elsif "#{element_type}" == 'button'
    @button_exist = @browser.button(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@button_exist).to be true
  else
    @element_exist = @browser.element(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@element_exist).to be true
  end
end

# Don't EXIST - check if div or other element
And (/^check "([^"]*)" by "([^"]*)" "([^"]*)" does not exist$/) do |element_type, selector_type, selector_name|
  if "#{element_type}" == 'div'
    @div_exist = @browser.div(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@div_exist).to be false
  else
    @element_exist = @browser.element(:"#{selector_type}" => "#{selector_name}").exists?
    expect(@element_exist).to be false
  end
end

# Array of values (authors)
And (/^in section "([^"]*)" "([^"]*)", content contains multiple values: "([^"]*)"$/) do |section_selector_type, section_name, array_content|
  element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").text

  array_content = "#{array_content}".split(/,/)
  array_content.each do |content|
    expect(element_content.downcase.include?("#{content}".downcase)).to be true
  end
end


And (/^check element by "([^"]*)" "([^"]*)", content contains "([^"]*)"$/) do |selector_type, selector_name, content|
  @browser.element(:"#{selector_type}" => "#{selector_name}").wait_until_present
  @element_content = @browser.element(:"#{selector_type}" => "#{selector_name}").text
  # puts @element_content
  expect(@element_content.downcase.include?("#{content}".downcase)).to be true
end

And (/^check element by "([^"]*)" "([^"]*)", content does NOT contains "([^"]*)"$/) do |selector_type, selector_name, content|
  @browser.element(:"#{selector_type}" => "#{selector_name}").wait_until_present
  @element_content = @browser.element(:"#{selector_type}" => "#{selector_name}").text
  expect(@element_content.downcase.include?("#{content}".downcase)).to be false
end


And (/^check element by "([^"]*)" "([^"]*)" not present$/) do |selector_type, selector_name|
  @element_present =  @browser.element(:"#{selector_type}" => "#{selector_name}").present?
  puts @element_present
end

And (/^check HTML "([^"]*)" element, content contains "([^"]*)"$/) do |html_element, content|
  html_element = "#{html_element}"
  element_content = @browser.send(html_element).text

  expect(element_content.downcase.include?("#{content}".downcase)).to be true
end