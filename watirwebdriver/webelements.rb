# Text Fields
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
t = b.text_field :id => 'entry_1000000'
t.exists?
t.set 'your name'
t.value

# Select Lists – Combos
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
s = b.select_list :id => 'entry_1000001'
s.select 'Ruby'
s.selected_options

# Radios
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
r = b.radio :value => 'A gem'
r.exists?
r.set
r.set?

# Checkboxes
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
c = b.checkbox :value => '1.9.2'
c.exists?
c.set
c.set?

# Buttons
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
btn = b.button :value => 'Submit'
btn.exists?
btn.click

# Links
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
l = b.link :text => 'Google Forms'
l.exists?
l.click

# Divs & Spans
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
d = b.div :class => 'ss-form-desc ss-no-ignore-whitespace'
d.exists?
d.text
s = b.span :class => 'powered-by-text'
s.exists?
s.text