require_relative 'main_nav_panel'

class HomePage 
  include PageObject
  include MainNavPanel
      
  page_url "http://www.rcsb.org/"
    
end