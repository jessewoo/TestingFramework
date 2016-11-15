And (/^click on image with "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|
  puts @browser.image(:"#{selector_type}" => "#{selector_name}").parent.href
  @browser.image(:"#{selector_type}" => "#{selector_name}").parent.click
  puts @browser.url
end

And (/^in section "([^"]*)" "([^"]*)", click on link with "([^"]*)" "([^"]*)"$/) do |section_selector_type, section_name, selector_type, selector_name|    

  @link_location = @browser.div(:"#{section_selector_type}" => "#{section_name}").link(:"#{selector_type}" => "#{selector_name}")
  # puts @link_location.when_present.text
  @link_location.when_present.click
  
  if "#{section_name}".downcase.include? "homepage_panelslides"
    expect(@browser.url.include?("#{selector_name}")).to be true
    sleep 0.5
  else  
    puts @browser.url
  end  
end

# Element with onclick JS event
And (/^in section "([^"]*)" "([^"]*)", click on element with "([^"]*)" "([^"]*)" using onclick-JS$/) do |section_selector_type, section_name, element_selector_type, element_selector_name|
  
  @browser.div(:"#{section_selector_type}" => "#{section_name}").element(:"#{element_selector_type}" => "#{element_selector_name}").fire_event :click
end

# Regex to find text
And (/^in section "([^"]*)" "([^"]*)", click on link that containing text "([^"]*)"$/) do |section_selector_type, section_name, link_text|
  
  @browser.div(:"#{section_selector_type}" => "#{section_name}").link(:text => /#{link_text}/).click
end


And (/^click on link with "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|    
  @browser.link(:"#{selector_type}" => "#{selector_name}").click
end


And (/^hover "([^"]*)" navigation, click on link with "([^"]*)" "([^"]*)"$/) do |main_nav_title, selector_type, selector_name|    
  if @browser.url.include? "http://pdb101.rcsb.org/"
    nav_array = ["molecule of the month", "browse", "learn", "teach", "events", "geis archive", "more"]
  else
    nav_array = ["deposit", "search", "visualize", "analyze", "download", "learn", "more"]
  end
  
  hash = Hash[nav_array.map.with_index.to_a]
  index = hash["#{main_nav_title}".downcase]

  @browser.element(:class => "nav").element(:class => "dropdown", :index => index).fire_event 'mouseover'
  @browser.element(:class => "nav").link(:"#{selector_type}" => "#{selector_name}").click

end