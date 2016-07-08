# https://watirwebdriver.com/waiting/

require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
b.text_field(:id => 'entry_1000000').when_present.set 'your name'
b.select_list(:id => 'entry_1000001').wait_until_present
b.select_list(:id => 'entry_1000001').select('Ruby')
b.button(:value => 'Submit').click
b.button(:value => 'Submit').wait_while_present
Watir::Wait.until { b.text.include? 'Thank you' }
