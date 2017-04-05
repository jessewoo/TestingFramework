And (/^the count of "([^"]*)" with "([^"]*)" "([^"]*)" is equal "([^"]*)"$/) do |html_element, selector_type, selector_name, count_value|


  if "#{html_element}" == "li"
  	each_element = @browser.lis(:"#{selector_type}" => "#{selector_name}")
	else "#{html_element}" == "div"
  	each_element = @browser.divs(:"#{selector_type}" => "#{selector_name}")
  end

  expect(each_element.length).to eq "#{count_value}".to_i

end

And (/^list out the "([^"]*)" of "([^"]*)" with "([^"]*)" "([^"]*)"$/) do |specific_content, html_element, selector_type, selector_name|


  if "#{html_element}" == "li"
  	each_element = @browser.lis(:"#{selector_type}" => "#{selector_name}")
	else "#{html_element}" == "div"
  	each_element = @browser.divs(:"#{selector_type}" => "#{selector_name}")
  end

  specific_content = "#{specific_content}"
  each_element.each do |list|
  	puts list.send(specific_content).text
  end	

end

And (/^list out the "([^"]*)" of "([^"]*)" with index "(\d)" and with "([^"]*)" "([^"]*)"$/) do |specific_content, html_element, index, selector_type, selector_name|

  if "#{html_element}" == "li"
  	each_element = @browser.lis(:"#{selector_type}" => "#{selector_name}")
	else "#{html_element}" == "div"
  	each_element = @browser.divs(:"#{selector_type}" => "#{selector_name}")
  end

	specific_content = "#{specific_content}"
	puts each_element["#{index}".to_i].send(specific_content).text

end