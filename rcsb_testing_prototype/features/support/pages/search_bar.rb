# Elements COMMON on all RCSB pages
module SearchBar
  include PageObject
      
  text_field(:search_bar, :id => "autosearch_SearchBar")
  button(:search_button, :id => 'searchbutton')

end