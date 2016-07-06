require 'cap_helper'

describe "BE - Sign up via storefront: ", js: true, signup: true do
  include CommonUtil
  # include Capybara::DSL # need this if we use Capybara-specific methods, like "visit".

  let(:mobile_customer){ Customer.new.tap{|cust| cust.agents = ['ios']} }
  let(:web_mobile_customer){ Customer.new.tap{|cust| cust.agents = ['java','android']} }
  let(:dot_net_customer){ Customer.new.tap{|cust| cust.agents = ['dotnet']} }
  let(:web_customer){ Customer.new }
  let(:signup_ui_form){ SignUpUiForm.new }

  #...

  describe "BE - Sign up via storefront form: " do

    before(:each) do
      Capybara.app_host = STOREFRONT_DOMAIN
      signup_ui_form.load
    end

    it "1) creates a new web-only account" do
      signup_ui_page.enter_signup_form(web_customer)
      expect(lsd_page).to be_web_only
      logout
    end

    it "2) creates a new mobile-only account" do
      signup_ui_page.enter_signup_form(mobile_customer)
      expect(lsd_page).to be_mobile_only
      logout
    end

    #... 

    it "11) checks validation error if invalid email was entered" do
      signup_ui_page.enter_signup_info_step1(invalid_email)
      signup_ui_page.enter_signup_info_step2(web_customer)
      signup_ui_page.create_my_free_account_in_form_button.click
      expect(signup_ui_page).to have_content signup_ui_page.invalid_email_error
    end
  end

  # ...
  
  after(:each) do
    teardown
  end
end
