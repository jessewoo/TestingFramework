module HomepagePanelNav
	include PageObject

# Select the link instead of list element
	link(:panel_welcome, :href => "#Category-welcome")
	link(:panel_deposit, :href => "#Category-deposit")
	link(:panel_search, :href => "#Category-search")
	link(:panel_visualize, :href => "#Category-visualize")
	link(:panel_analyze, :href => "#Category-analyze")
	link(:panel_download, :href => "#Category-download")
	link(:panel_learn, :href => "#Category-learn")
    
end