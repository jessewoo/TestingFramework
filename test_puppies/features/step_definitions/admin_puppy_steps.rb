Given /^I have a pending adoption for "([^\"]*)"$/ do |name| 
	# on_page(HomePage).select_puppy 
	# on_page(DetailsPage).add_to_cart 
	# on_page(ShoppingCartPage).proceed_to_checkout 
	# on_page(CheckoutPage).checkout('name' => name)

# Use navigate_to method to remove the duplication. Navigation_to method begins at hte BEGINNING of a route, calls the methods on the class
	navigate_to(CheckoutPage).checkout('name' => name)
end

When /^I process that adoption$/ do 
	visit_page(LandingPage) 
	on_page(LoginPage).login_to_system 
	on_page(LandingPage).adoptions 
	on_page(ProcessPuppyPage).process_first_puppy
end