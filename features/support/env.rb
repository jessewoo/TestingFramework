# Inheritance
require 'watir-webdriver'
require 'cucumber'
require 'page-object'
require 'page-object/page_factory'
require 'rspec-expectations'
require 'data_magic'

World(PageObject::PageFactory)

TEST_DATA_DIR = "./features/support/test_data"
DataMagic.yml_directory = './features/support/test_data/' #Tells data magic to look for data in


def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
end

def environment
    (ENV['ENVIRONMENT'] ||= 'prod').downcase.to_sym
end

Before do |scenario|
  def assert_it message, &block
    begin
      if (block.call)
        puts "Assertion PASSED for #{message}"
      else
        puts "Assertion FAILED for #{message}"
        fail('Test Failure on assertion')
      end
    rescue => e
      puts "Assertion FAILED for #{message} with exception '#{e}'"
      fail('Test Failure on assertion')
    end
  end
  p "Starting #{scenario}"
  
  if environment == :int
    @browser = Watir::Browser.new browser_name
    @browser.goto "http://sandbox.amazon.com"
    @browser.text_field(:id=>'username').set "test"
    @browser.text_field(:id=>'password').set "test1234"
    @browser.button(:id => 'submit').click

  elsif environment == :local
    @browser = Watir::Browser.new browser_name
    @browser.goto "http://localhost/"

  elsif environment == :prod
    @browser = Watir::Browser.new browser_name
  end
end

