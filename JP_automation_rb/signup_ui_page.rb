require 'cap_helper'

class SignUpUiPage < SitePrism::Page
  include CommonUtil

  attr_accessor :name_error, :phone_error, :email_error, :password_error, :location_error,
                #...
                :invalid_email_error,  :invalid_password_error

  def initialize(args = {})
    @name_error = args.fetch(:name_error, "Please provide your full name")
    @phone_error = args.fetch(:phone_error, "Please enter your phone number")
    @email_error = args.fetch(:email_error, "Is that an accurate email address?")
    #...

  end

  set_url "/"

  element :create_my_free_account_button, "#nav_header .cta-button"

  # Signup form elements
  element :name, "#signup-full-name"
  element :phone, "#signup-phone-number"
  element :email, "#signup-email"
  element :password, "#signup-password"
  
  # ...

  # Agents
  element :python, "#signup_platform_chzn_o_0"
  element :php, "#signup_platform_chzn_o_1"
  element :java, "#signup_platform_chzn_o_2"
  element :ruby, "#signup_platform_chzn_o_3"
  element :dotnet, "#signup_platform_chzn_o_4"
  element :nodejs, "#signup_platform_chzn_o_5"
  element :ios, "#signup_platform_chzn_o_6"
  element :android, "#signup_platform_chzn_o_7"

  def create_free_account
    create_my_free_account_button.click
  end

  def enter_name(customer)
    name.set customer.name
  end

  def enter_phone(customer)
    phone.set customer.phone
  end
  
  #...

  def enter_signup_info_step1(customer)
    enter_name(customer)
    enter_phone(customer)
    enter_email(customer)
    enter_password(customer)
    select_location(customer)
  end

  def select_country(country)
    country_dropdown.click
    country_name =
      case country
        when "United States"
          united_states
        when "Angola"
          angola
        else
          puts country + " is not yet implemented"
      end
    country_name.click
  end

# ...
end