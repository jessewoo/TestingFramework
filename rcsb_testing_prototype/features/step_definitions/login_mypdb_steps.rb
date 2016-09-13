Given /^I have a pending adoption for "([^\"]*)"$/ do |name| 

	navigate_to(CheckoutPage).checkout('name' => name)
end

When /^I process that adoption$/ do 
	visit_page(LandingPage) 
	on_page(LoginPage).login_to_system 
	on_page(LandingPage).adoptions 
	on_page(ProcessPuppyPage).process_first_puppy
end