# Elements COMMON on all RCSB pages
module SearchBar
  include PageObject
      
  text_field(:search_bar, :id => "autosearch_SearchBar")
  button(:search_button, :id => 'searchbutton')

  link(:advanced_search_link, :href => '/pdb/search/advSearch.do?search=new')

end