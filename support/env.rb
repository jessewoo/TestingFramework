# Anti-pattern one: frequently opening and closing browsers
browser = Watir::Browser.new

Before do
  @browser = browser
end
 
at_exit do
  browser.close
end