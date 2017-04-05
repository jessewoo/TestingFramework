And (/^check table by "([^"]*)" "([^"]*)" exist$/) do |selector_type, selector_name|
  table_exist = @browser.table(:"#{selector_type}" => "#{selector_name}").exists?
  expect(table_exist).to be true
end

And (/^check table by "([^"]*)" "([^"]*)", content contains "([^"]*)" in cell with row "([^"]*)", column "([^"]*)"$/) do |selector_type, selector_name, content, row, column|

  if "#{content}" == "none"
    expect(@browser.table(:"#{selector_type}" => "#{selector_name}")["#{row}".to_i]["#{column}".to_i].exists?).to be false
    # puts "Unable to location content and table"
  else
    element_content = @browser.table(:"#{selector_type}" => "#{selector_name}")["#{row}".to_i]["#{column}".to_i].text
    # puts @element_content
    expect(element_content.downcase.include?("#{content}".downcase)).to be true
  end
end

And (/^check table by index of "([^"]*)", content contains "([^"]*)" in cell with row "([^"]*)", column "([^"]*)"$/) do |index, content, row, column|
  if "#{content}" == "none"
    expect(@browser.table(:index => "#{index}".to_i)["#{row}".to_i]["#{column}".to_i].exists?).to be false
    # puts "Unable to location content and table"
  else
    element_content = @browser.table(:index => "#{index}".to_i)["#{row}".to_i]["#{column}".to_i].text
    expect(element_content.downcase.include?("#{content}".downcase)).to be true
  end
end

And (/^in section "([^"]*)" "([^"]*)", check table by index of "([^"]*)", content contains "([^"]*)" in cell with row "([^"]*)", column "([^"]*)"$/) do |section_selector_type, section_name, index, content, row, column|

  element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").table(:index => "#{index}".to_i)["#{row}".to_i]["#{column}".to_i].text
  expect(element_content.downcase.include?("#{content}".downcase)).to be true

end

And (/^in section "([^"]*)" "([^"]*)", check table by index of "([^"]*)", content contains "([^"]*)"$/) do |section_selector_type, section_name, index, content|
  if "#{content}" == "none"
    expect(@browser.element(:"#{section_selector_type}" => "#{section_name}").table(:index => "#{index}".to_i).exists?).to be false
    # puts "Unable to location content and table"
  else
    element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").table(:index => "#{index}".to_i).text
    expect(element_content.downcase.include?("#{content}".downcase)).to be true
  end
end

# Array of values (Ligands, BIRDS)
And (/^in section "([^"]*)" "([^"]*)", check table by index of "([^"]*)", content contains multiple values: "([^"]*)"$/) do |section_selector_type, section_name, index, array_content|
    element_content = @browser.element(:"#{section_selector_type}" => "#{section_name}").table(:index => "#{index}".to_i).text

    array_content = "#{array_content}".split(/,/)
    array_content.each do |content|
      expect(element_content.downcase.include?("#{content}".downcase)).to be true
    end
end