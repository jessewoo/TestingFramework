require "capybara/cucumber"
require "rspec/expectations"
require 'capybara/poltergeist'
 
Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
    options = {
    	# Detect JS errors
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        # Configured option to not load images on the page
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
end
