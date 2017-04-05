And (/^focus on the "([^"]*)" with index "([^"]*)" and with "([^"]*)" "([^"]*)"$/) do |html_element, index, selector_type, selector_name|

  if "#{html_element}" == "li"
  	each_element = @browser.lis(:"#{selector_type}" => "#{selector_name}")
	else "#{html_element}" == "div"
  	each_element = @browser.divs(:"#{selector_type}" => "#{selector_name}")
  end

  puts each_element["#{index}".to_i].text

end