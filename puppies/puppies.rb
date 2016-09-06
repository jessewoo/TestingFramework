require'rubygems'
require'watir-webdriver'

# ruby file to be executed 
require_relative 'adoption_helper.rb'

include AdoptionHelper

# WHAT IS BEING DONE
goto_the_puppy_adoption_site
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
checkout_with('Cheezy','123 Main','cheezy@foo.com','Check')
verify_page_contains'Thank you for adopting a puppy!'
close_the_browser