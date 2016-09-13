class ShoppingCartPage
  
  include PageObject
  
  # Constants
  NAME_COLUMN = 1 unless const_defined?(:NAME_COLUMN)
  SUBTOTAL_COLUMN = 3 unless const_defined?(:SUBTOTAL_COLUMN)
  LINES_PER_PUPPY = 6 unless const_defined?(:LINES_PER_PUPPY)
  
  button(:proceed_to_checkout, :value => "Complete the Adoption")
  button(:continue_adopting, :value => "Adopt Another Puppy")
  table(:cart, :index => 0)
  cell(:cart_total, :class => "total_cell")
  
  
  # def initialize(browser) 
  #     @browser = browser
  #   end 


# General methods called from step definitions
  def name_for_line_item(line_item) 
    cart_line_item(line_item)[NAME_COLUMN].text
  end
  
  def subtotal_for_line_item(line_item) 
    cart_line_item(line_item)[SUBTOTAL_COLUMN].text
  end
  
  # def cart_total
  #   @browser.td(:class => 'total_cell').text
  # end
  # 
  # def proceed_to_checkout
  #   @browser.button(:value => 'Complete the Adoption').click
  # end
  # 
  # def continue_adopting
  #   @browser.button(:value => 'Adopt Another Puppy').click
  # end
  
# 2 methods designed to only be called from other methods of the class. "internal" methods stay internal
  private
  
  def row_for(line_item) 
    (line_item - 1) * LINES_PER_PUPPY
  end
  
  def cart_line_item(line_item) 
    # @browser.table(:index => 0)[row_for(line_item)]
    cart_element[row_for(line_item)]
  end

end

