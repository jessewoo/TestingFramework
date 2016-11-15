RCSB Automated Testing Framework 
====================================

### PURPOSE
Created a list of "step" ingredients for developers to build their own independent automated behavioral tests. The "step" ingredients are the foundational basic parts in building a test from scratch. Developers only need to pick out the right "step" ingredient then replace the variables within the double quotes.

### TEST EXAMPLES
#### Example ONE
> Scenario: Search PDB ID<br/>
> - Given connect to "http://www.rcsb.org"<br/>
> - And search for "1STP"<br/>
> - And check, browser "url" contains "explore/explore.do"

#### Example TWO
> Scenario: Search PDB ID Alternative Steps<br/>
> - Given connect to "http://www.rcsb.org"<br/>
> - And fill in text input "id" "autosearch_SearchBar" with "Collagen"
> - And click on button with "id" "searchbutton"
> - And check, browser "title" contains "RCSB PDB - Search Results"
> - And check, browser "url" contains "results/results.do"
> - And check element by "id" "SearchParameterText", content contains "Collagen"

In the two different examples, both utilized the "And check, browser 'XYZ' contains 'XYZ'". 

#### EXAMPLE THREE
> Scenario: Download Tool (form within multiple forms on page)
> - Given connect to "http://www.rcsb.org"
> - And hover "Download" navigation, click on link with "href" "/pdb/download/download.do#Structures"
> - And fill in text input "id" "structureIdList" with "4hhb, 1stp"
> - And in section "download_structures_panel", checkbox with "name" "doPdb", mark as "checked"
> - And in section "download_structures_panel", select radio button with "name" "compressed"
> - And in section "download_structures_panel", click on button with "class" "btn-primary"

### BASIC "STEP" INGREDIENTS
Categorized accordingly to the function of the "step" ingredient:

* Browser Related
	* connect to `"<url link>"`
    ```ruby
    Given connect to "http://www.rcsb.org"
    ```
	* check, browser `"<browser property>"` contains `"<browser value>"`
		* `"<browser property>"` could be url, title
    ```ruby
    And check, browser "title" contains "RCSB Protein Data Bank - RCSB PDB"
    And check, browser "url" contains "http://www.rcsb.org/pdb/home/home.do"
    ```
* Check Elements
	* check element by `"<selector type>"` `"<selector name>"`, value `"<numerical operator>"` `"<number value>"`
		* `"<selector type>"` could be id, class, css
		* `"<numerical operator>"` could be >, <, =
    ```ruby
    And check element by "id" "CurrentStructureCount", value ">" "123456"
    ```
	* check element by `"<selector type>"` `"<selector name>"`, content contains `"<content>"`
    ```ruby
    And check element by "id" "SearchParameterText", content contains "HIV"
		And check element by "class" "macromoleculeRow", content contains "Streptavidin"
    ```
* Click Elements
	* click on image with `"<selector type>"` `"<selector name>"`
	```ruby
	And click on image with "alt" "RCSB PDB Molecule of the Month"
	```
	* in section `"<section selector type>"` `"<section name>"`, click on link with `"<selector type>"` `"<selector name>"`
		* `"<selector type>"` could be id, class, text, href
	```ruby
	And in section "id" "header", click on link with "text" "Advanced Search"
	And in section "id" "homepage_panelslides", click on link with "href" "#Category-search"
	```
	* in section `"<section selector type>"` `"<section name>"`, click on element with `"<selector type>"` `"<selector name>"` using onclick-JS
		* `"<selector type>"` could be id, class, text
	```ruby
	And in section "id" "drilldown_options", click on element with "text" "Polymer Type" using onclick-JS
	```
	* click on link with `"<selector type>"` `"<selector name>"`
		* `"<selector type>"` could be id, href
	* hover `"<top bar navigation title>"` navigation, click on link with `"<selector type>"` `"<selector name>"`
		* `"<top bar navigation title>"` could be one of the following Deposit, Visualize, Search, Analyze...
	```ruby
	And hover "Download" navigation, click on link with "href" "/pdb/download/download.do#Structures"
	```
* Form Elements
	* select option with `"<option type>"` `"<option value>"` in dropdown with `"<select selector type>"` `"<select selector value>"`
		* `"<option type>"` could be value, text, id
		* `"<select selector type>"` could be id, class
	```ruby
	And select option with "value" "StructureIdQuery" in dropdown with "id" "smartSearchSubtype_0"
	```
	* in section `"<section selector type>"` `"<section name>"`, checkbox with `"<checkbox selector type>"` `"<checkbox selector value>"`, mark as `"<checked>"`
		* `"<section name>"` needs to be id of that specific container
		* `"<checkbox selector type>"` could be name, text
		* `"<checked>"` needs to be checked, clear
	```ruby
	And in section "id" "download_structures_panel", checkbox with "name" "doPdb", mark as "checked"
	```
	* in section `"<section selector type>"` `"<section name>"`, select radio button with `"<radio button selector type>"` `"<radio button selector value>"`
		* `"<radio button selector type>"` could be name, text
	```ruby
	And in section "id" "download_structures_panel", select radio button with "name" "compressed"
	```
	* fill in text input `"<input selector type>"` `"<input selector name>"` with `"<input value>"`
	```ruby
	And fill in text input "id" "autosearch_SearchBar" with "HIV"
	```
	* click on button with `"<button selector type>"` `"<button selector name>"`
		* `"<button selector type>"` could be text, id
	```ruby
	And click on button with "id" "searchbutton"
	```
	* in section `"<section selector type>"` `"<section name>"`, click on button with `"<button selector type>"` `"<button selector name>"`
	```ruby
	And in section "id" "download_structures_panel", click on button with "class" "btn-primary"
	```

### HOW TO RUN ON TERMINAL
Categorized accordingly to the function of the "step" ingredient:
```bash
time cucumber CHROME=true features/basic_test_suite.feature
time cucumber features/basic_test_suite.feature
```







