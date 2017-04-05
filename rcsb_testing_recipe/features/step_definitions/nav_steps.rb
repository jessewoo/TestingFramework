# Top Bar Navigation - HOVER
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

# Used only in Drill down Search Panel
And (/^in drilldown search panel, click on subnav with text "([^"]*)"$/) do |search_category|

  @click_link = @browser.ul(:id => "drilldown_options").li(:text => "#{search_category}")
  # puts @click_link.html
  @click_link.fire_event :click

end