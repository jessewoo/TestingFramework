And (/^wait "([^"]*)" seconds$/) do |seconds|
  # Takes into consideration of target="_blank"
  sleep "#{seconds}".to_i
end

And (/^add note: "([^"]*)"$/) do |note|
	puts "#{note}"
end

And /^press enter$/ do
	@browser.send_keys :enter
end

# NOTE: Element is NOT clickable if Element is NOT visible
And (/^scroll to element "([^"]*)" "([^"]*)"$/) do |selector_type, selector_name|
	@browser.element(:"#{selector_type}" => "#{selector_name}").wd.location_once_scrolled_into_view
end

And (/^wait for element "([^"]*)" with "([^"]*)" "([^"]*)" to appear$/) do |element_type, input_selector_type, input_selector_name|
	if "#{element_type}" == "textarea"
		@browser.text_field(:"#{input_selector_type}" => "#{input_selector_name}").wait_until_present
	else
		@browser.element(:"#{input_selector_type}" => "#{input_selector_name}").wait_until_present
    # puts @browser.element(:"#{input_selector_type}" => "#{input_selector_name}").text
	end
end


And (/^take screenshot of "([^"]*)"$/) do |filename|
	if ENV['URL']
		@browser.screenshot.save 'screenshots/screenshot_' + "#{filename}" + '_' + ENV['URL'] + '.png'
  else
		@browser.screenshot.save 'screenshots/screenshot_' + "#{filename}" + '.png'
  end
end

And (/^save web page with filename of "([^"]*)"$/) do |filename|
	@frameworkDir = File.expand_path('../../..', __FILE__)
	if ENV['URL']
		File.open(@frameworkDir + '/html/' + filename + '_' + ENV['URL'] + '.html', 'w') {|f| f.write @browser.html }
	else
		File.open(@frameworkDir + '/html/' + filename + '.html', 'w') {|f| f.write @browser.html }
	end
end

And (/^save web page with filename of "([^"]*)" including "([^"]*)"$/) do |filename, meta|
	@frameworkDir = File.expand_path('../../..', __FILE__)
	if ENV['URL']
		File.open(@frameworkDir + '/html/' + filename + '-' + meta + '_' + ENV['URL'] + '.html', 'w') {|f| f.write @browser.html }
	else
		File.open(@frameworkDir + '/html/' + filename + '-' + meta + '.html', 'w') {|f| f.write @browser.html }
	end
end

And /^check whether page has all images$/ do
	# harvest image srcs
  urls = @browser.div(:id, 'maincontentcontainer').images.collect(&:src)
	error404_count = 0

	urls.each do |url|
	  begin
	    open(url) do |f|
	      # puts "#{f.base_uri} - #{f.status}"
	    end
	  rescue => e
	    if (e).to_s == "404 Not Found"
	    	puts "IMAGE NONEXISTENCE: #{url}";
	    	error404_count = error404_count + 1
	    end
	  end
	end

	if error404_count > 0
		puts "#{error404_count} - '404' Error Exists"
	end

	# Expectation that there will NO 404 images
	expect(error404_count).to eq 0
end