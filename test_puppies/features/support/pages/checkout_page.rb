# Include the module
require_relative 'error_panel'

class CheckoutPage 
  include PageObject
  include DataMagic
  include ErrorPanel
  
  text_field(:name, :id => "order_name")
  text_field(:address, :id => "order_address")
  text_field(:email, :id => "order_email")
  select_list(:pay_type, :id => "order_pay_type")
  button(:place_order, :value => "Place Order")  

  # Required to have a receiver so they aren't mistaken for local variable
  def checkout(data = {})
    # populate_page_with DEFAULT_DATA.merge(data) 
    populate_page_with data_for(:checkout_page, data)
    
    # data = DEFAULT_DATA.merge(data)
    #     self.name = data['name'] 
    #     self.address = data['address'] 
    #     self.email = data['email'] 
    #     self.pay_type = data['pay_type'] 
    
    place_order
  end

  #   def initialize(browser) 
  #     @browser = browser
  #   end
  # 
  #   def name=(name)
  #     @browser.text_field(:id => "order_name").set(name)
  #   end
  # 
  #   def address=(address)
  #     @browser.text_field(:id => "order_address").set(address)
  #   end
  # 
  #   def email=(email)
  #     @browser.text_field(:id => "order_email").set(email)
  #   end
  # 
  #   def pay_type=(pay_with)
  #     @browser.select_list(:id => "order_pay_type").select(pay_with)
  #   end
  # 
  #   def place_order
  #     @browser.button(:value => "Place Order").click
  #   end 

# REMOVE DEFAULT DATA HASH FROM PAGE 
  # DEFAULT_DATA = {
  #   'name' => 'cheezy',
  #   'address' => '123 Main Street',
  #   'email' => 'cheezy@example.com',
  #   'pay_type' => 'Purchase order'
  # }  
  
  # DEFAULT_DATA = {
  #     'name' => Faker::Name.name,
  #     'address' => Faker::Address.street_address,
  #     'email' => Faker::Internet.email,
  #     'pay_type' => 'Credit card'
  # }  

# MOVE TO OWN MODULE - DOES A CALL REQUEST 
  # div(:error_div, :id => 'error_explanation') 
  # unordered_list(:error_list) do |page|
  #   page.error_div_element.unordered_list_element 
  # end
  
  # def error_messages 
  #   error_list_element.text
  # end

  
end