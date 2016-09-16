module MainNavPanel
	include PageObject

	link(:panel_welcome, :id => "mainnav_welcome")
	link(:panel_deposit, :id => "mainnav_deposit")
	link(:panel_search, :id => "mainnav_search")
	link(:panel_visualize, :id => "mainnav_visualize")
	link(:panel_analyze, :id => "mainnav_analyze")
	link(:panel_download, :id => "mainnav_download")
	link(:panel_learn, :id => "mainnav_learn")
    
end