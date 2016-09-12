require_relative 'side_menu_panel'

class HomePage 
  include PageObject
  include SideMenuPanel
      
  PUPPY_LOOKUP = {
    'Brook' => 0,
    'Hanna' => 1
  }    
      
  page_url "http://puppies.herokuapp.com"    
      
  # button(:first_puppy, :value => 'View Details', :index => 0)
  # button(:second_puppy, :value => 'View Details', :index => 1) 
  
  # Find elements when the script is running "_element" locates it
  # def select_puppy_number(num)
  #   button_element(:value => 'View Details', :index => num - 1).click
  # end
  
  # def select_puppy(name)
  #   index = puppy_index_for(name)
  #   button_element(:value => 'View Details', :index => index).click
  # end
  
  def select_puppy(name = 'Brook')
    index = puppy_index_for(name)
    button_element(:value => 'View Details', :index => index).click
  end
  
  private
  
  def puppy_index_for(name)
    PUPPY_LOOKUP[name]
  end
  
  
end