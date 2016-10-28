require 'rubygems'
require 'watir-webdriver'
require 'phantomjs'

b = Watir::Browser.new :phantomjs

b.goto "www.google.com"

puts b.title

b.close


# https://groups.google.com/forum/#!topic/selenium-users/oVrkjS5DQQk
# https://github.com/SeleniumHQ/selenium/issues/2614
# https://bugs.chromium.org/p/chromedriver/issues/detail?id=1549
# https://bugs.chromium.org/p/chromedriver/issues/detail?id=1451

# https://github.com/SeleniumHQ/selenium/issues/2577
# http://stackoverflow.com/questions/39648468/watir-timeout-issue-with-firefox