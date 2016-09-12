require 'rspec/expectations'
require 'page-object'
require'page-object/page_factory'
require 'data_magic'

# Require all of the files located in the directory you provide
require 'require_all'

World(PageObject::PageFactory)

require_all File.dirname(__FILE__) + '/pages'


# Navigate_to method begins at the beginning of a route, calls the methods on the class till it arrives at desired location
PageObject::PageFactory.routes = {
   :default => [[HomePage, :select_puppy],
	           [DetailsPage, :add_to_cart],
	           [ShoppingCartPage, :proceed_to_checkout],
	           [CheckoutPage, :checkout]],
}
