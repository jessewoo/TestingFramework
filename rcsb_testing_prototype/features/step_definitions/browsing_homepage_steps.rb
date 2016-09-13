Given /^I am on the rcsb.org site$/ do 
  # @browser.goto "http://puppies.herokuapp.com"
  # @home = HomePage.new(@browser)
  visit_page(HomePage)
end

# Generic Method
When /^I click the View Details button for "([^\"]*)"$/ do |name|
  # @browser.button(:value => "View Details").click
  on_page(HomePage).select_puppy name
end

# Adopting 2 puppies - DEPRECATED
When(/^I click the first View Details button$/) do
  # @browser.button(:value => "View Details", :index => 0).click
  @home.select_puppy_number 1
  @details = DetailsPage.new(@browser)
end

When /^I complete the adoption using a Credit card$/ do       
  on_page(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When /^I complete the adoption$/ do 
  on_page(CheckoutPage).checkout
end

When /^I complete the adoption of a puppy$/ do 
  # on_page(HomePage).select_puppy 
  # on_page(DetailsPage).add_to_cart 
  # on_page(ShoppingCartPage).proceed_to_checkout 
  # on_page(CheckoutPage).checkout

  navigate_to(CheckoutPage).checkout
end


# Error Message that pops up with Name Field Blank
When /^I checkout leaving the name field blank/ do 
  # on_page(HomePage).select_puppy 
  # on_page(DetailsPage).add_to_cart 
  # on_page(ShoppingCartPage).proceed_to_checkout 
  # # Use all the default data except for the name field, pass an empty String
  # on_page(CheckoutPage).checkout('name' => '')

  navigate_to(CheckoutPage).checkout('name' => '')
end

Then /^I should see the error message "([^\"]*)"$/ do |msg| 
  # on_page(CheckoutPage).error_messages.should include msg
  @current_page.error_messages.should include msg
end

# DEPRECATED
And(/^I click the second View Details button$/) do
  # @browser.button(:value => "View Details", :index => 1).click
  @home.select_puppy_number 2
  # Go to this page when we click on "view details" button
  @details = DetailsPage.new(@browser)
end

When /^I click the Adopt Me button$/ do 
  # @browser.button(:value => "Adopt Me!").click
  # @details.add_to_cart
  on_page(DetailsPage).add_to_cart
  # Encapsulate the complexity of hte code to new page object
  # @cart = ShoppingCartPage.new(@browser)
end

When /^I click the Adopt Another Puppy button$/ do 
  # @cart.continue_adopting
  on_page(ShoppingCartPage).continue_adopting
end

When /^I click the Complete the Adoption button$/ do 
  # @cart.proceed_to_checkout
  on_page(ShoppingCartPage).proceed_to_checkout
  # @checkout = CheckoutPage.new(@browser)
end

When /^I enter "([^\"]*)" in the name field$/ do |name| 
  # @browser.text_field(:id => "order_name").set(name)
  # @checkout.name = name
  on_page(CheckoutPage).name = name
end

When /^I enter "([^\"]*)" in the address field$/ do |address| 
  # @browser.text_field(:id => "order_address").set(address)
  # @checkout.address = address
  on_page(CheckoutPage).address = address
end

When /^I enter "([^\"]*)" in the email field$/ do |email| 
  # @browser.text_field(:id => "order_email").set(email)
  # @checkout.email = email
  on_page(CheckoutPage).email = email
end

When /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_type| 
  # @browser.select_list(:id => "order_pay_type").select(pay_type)
  # @checkout.pay_type = pay_type
  on_page(CheckoutPage).pay_type = pay_type
end

When /^I click the Place Order button$/ do 
  # @browser.button(:value => "Place Order").click
  # @checkout.place_order
  on_page(CheckoutPage).place_order
end

When /^I complete the adoption with:$/ do |table|
  on_page(CheckoutPage).checkout(table.hashes.first)
end

Then /^I should see "([^\"]*)"$/ do |expected|
  # @browser.text.should include expected
  @current_page.text.should include expected
  # @browser.close
end

Then /^I should see "([^\"]*)" as the name for (line item \d+)$/ do |name, line_item| 
  # @cart.name_for_line_item(line_item.to_i).should include name 
  on_page(ShoppingCartPage).name_for_line_item(line_item).should include name
end

When /^I should see "([^\"]*)" as the subtotal for (line item \d+)$/ do |subtotal, line_item|
  # @cart.subtotal_for_line_item(line_item.to_i).should == subtotal  
  on_page(ShoppingCartPage).subtotal_for_line_item(line_item).should == subtotal
end

When /^I should see "([^\"]*)" as the cart total$/ do |total| 
  # @cart.cart_total.should == total
  on_page(ShoppingCartPage).cart_total.should == total
end