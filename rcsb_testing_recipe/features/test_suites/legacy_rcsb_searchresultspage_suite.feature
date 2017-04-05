Feature: Search Results Test Suite for Classic RCSB.org with SOLR results

  Background:
    Given connect to "http://searchprotowest.rcsb.org"

  Scenario: Search Results Page, Next Page
    And search for "Beta-lactamase" with match type "broad"
    And check, browser "title" contains "RCSB PDB - Search Results"
    And check, browser "url" contains "results/results.do?tabtoshow=Current"
    And check element by "id" "SearchParameterText", content contains "Beta-lactamase"
    And list out the total number of search results
    And the count of "li" with "class" "oneSearchResult" is equal "25"
    And in section "id" "toppager", click on button with "class" "nextPage"
    And wait for element "span" with "id" "getStartAtValue" to appear
    And wait for element "span" with "id" "getEndAtValue" to appear
    And wait for element "span" with "id" "getResultSizeValue" to appear
    And wait for text field with "id" "pageNum", value is equal "2"
    And check, browser "url" contains "gotopage=2"

  Scenario: Search Results Page, Next Page Input Field
    And search for "diabetes" with match type "broad"
    And check element by "id" "SearchParameterText", content contains "diabetes"
    And list out the total number of search results
    And the count of "li" with "class" "oneSearchResult" is equal "25"
    And fill in text input "id" "pageNum" with "2"
    And press enter
    And wait for element "span" with "id" "getStartAtValue" to appear
    And wait for text field with "id" "pageNum", value is equal "2"
    And check, browser "url" contains "gotopage=2"
    And fill in text input "id" "pageNum" with "4"
    And press enter
    And wait for element "span" with "id" "getStartAtValue" to appear
    And wait for text field with "id" "pageNum", value is equal "4"
    And check, browser "url" contains "gotopage=4"

  @error-variable
  Scenario: Display Number of Results
    And search for "lyme disease" with match type "broad"
    And list out the total number of search results
    And the count of "li" with "class" "oneSearchResult" is equal "25"
    And select option with "value" "50" in dropdown with "id" "ResultsPerPageOptions"
    And wait for element "span" with "id" "getStartAtValue" to appear
    And check, browser "url" contains "startAt=0&resultsperpage=50"
    And the count of "li" with "class" "oneSearchResult" is equal "50"
    And select option with "id" "showAllResults" in dropdown with "id" "ResultsPerPageOptions"
    And wait for element "span" with "id" "getStartAtValue" to appear
    And check, browser "url" contains "startAt=0&resultsperpage="
#    And the count of "li" with "class" "oneSearchResult" is equal "56"

  Scenario: Changing the Results View: Tabular
    And search for "Collagen" with match type "broad"
    And check, browser "title" contains "RCSB PDB - Search Results"
    And check, browser "url" contains "results/results.do"
    And check element by "id" "SearchParameterText", content contains "Collagen"
    And list out the total number of search results
    And add note: "Change to Tabular View"
    And select option with "value" "condensed" in dropdown with "id" "viewOptions"
    And check table by "id" "SearchResultsTable-MainContent" exist
    And add note: "Deselect all checkboxes"
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "unchecked"
    And in the search results table, select the row with PDB ID value "1CGD"
    And in the search results table, select the row with index "6"

  @error-variable
  Scenario: Changing the Results View: Gallery
    And search for "Deoxy Hemoglobin" with match type "phrase"
    And check element by "id" "SearchParameterText", content contains "Deoxy Hemoglobin"
    And list out the total number of search results
    And add note: "Change to Gallery View"
    And select option with "value" "gallery" in dropdown with "id" "viewOptions"
    And check "ul" by "id" "SearchResultsDetails-MainContent" exist
    And the count of "li" with "class" "oneGalleryResult" is equal "22"
#    And list out the "span" of "li" with "class" "oneGalleryResult"
    And select option with "value" "listedPdbIds" in dropdown with "id" "generateReports"
    And check, browser "url" contains "pdb/resultsV2/sids.jsp?qrid="
    And save web page with filename of "DeoxyHemoglobin"

# TODO: Currently NOT working
  Scenario: Changing the Results View: Timeline
    And search for "HIV capsid" with match type "phrase"
    And check element by "id" "SearchParameterText", content contains "HIV capsid"
    And list out the total number of search results
    And add note: "Change to Timeline View"
    And select option with "value" "timeline" in dropdown with "id" "viewOptions"
#    FAILING ON PRODUCTION AS WELL

  Scenario: Selection, Report Options: Structure Summary (3), Crystallization (5)
    And search for "Actin" with match type "broad"
    And check element by "id" "SearchParameterText", content contains "Actin"
    And list out the total number of search results
    And check "ul" by "id" "SearchResultsDetails-MainContent" exist
    And add note: "Deselect all checkboxes"
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "unchecked"
    And in the search results list, select the row with PDB ID value "1J6Z"
    And in the search results list, select the row with PDB ID value "4JHD"
    And in the search results list, select the row with PDB ID value "4PKI"
    And add note: "Select Structure Summary Report"
    And select option with "value" "structureSummary" in dropdown with "id" "generateReports"
    And wait for element "table" with "id" "customGrid" to appear
    And check, browser "url" contains "pdb/results/gridReport.do?reportTitle=structureSummary&qrid="
    And check element by "id" "gridResultCount", content contains "Total of 3 results"
    And check table by "id" "customGrid", content contains "1J6Z" in cell with row "1", column "1"
    And check table by "id" "customGrid", content contains "4JHD" in cell with row "2", column "1"
    And check table by "id" "customGrid", content contains "4PKI" in cell with row "3", column "1"
    And go back
    And add note: "Select Crystallization Report"
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "checked"
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "unchecked"
    And in the search results list, select the row with PDB ID value "4PKH"
    And in the search results list, select the row with PDB ID value "2Y83"
    And in the search results list, select the row with PDB ID value "1QZ6"
    And scroll to element "id" "topNavigationSearchResults"
    And in section "id" "toppager", click on button with "class" "nextPage"
    And wait for element "span" with "id" "getStartAtValue" to appear
    And wait for text field with "id" "pageNum", value is equal "2"
    And in the search results list, select the row with PDB ID value "3BYH"
    And in the search results list, select the row with PDB ID value "1HLU"
    And select option with "value" "crystallization" in dropdown with "id" "generateReports"
    And wait for element "table" with "id" "customGrid" to appear
    And check, browser "url" contains "pdb/results/gridReport.do?reportTitle=crystallization&qrid="
    And check element by "id" "gridResultCount", content contains "Total of 5 results"
    And take screenshot of "Crystallization - 5 Results"

  @error_20170403
  Scenario: Biological Details Report - Production
    Given connect to "http://www.rcsb.org"
    And search for "actin" with match type "broad"
    And check element by "id" "SearchParameterText", content contains "actin"
    And list out the total number of search results
    And check "ul" by "id" "SearchResultsDetails-MainContent" exist
    And add note: "Deselect all checkboxes"
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "unchecked"
    And in the search results list, select the row with PDB ID value "5IVU"
    And select option with "value" "biologicalDetails" in dropdown with "id" "generateReports"
    And check, browser "url" contains "results/gridReport.do?reportTitle=biologicalDetails"
    And wait for element "table" with "id" "customGrid" to appear
    And check element by "id" "gridResultCount", content contains "Total of 2 results"
    And go back
    And in section "class" "checkbox-toggle-control", checkbox with "id" "checkbox-toggle-control", mark as "checked"
    And select option with "value" "biologicalDetails" in dropdown with "id" "generateReports"
    And check element by "id" "gridResultCount", content does NOT contains "Total of 0 results"
    And check "tr" by "id" "1" exist


