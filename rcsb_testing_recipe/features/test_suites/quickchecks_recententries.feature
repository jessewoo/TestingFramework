Feature: Recent Entries Legacy Structure Pages

  Scenario: Check RECENTLY Structure Entries
    Given connect to "ENV['URL']"
    And scroll to element "id" "lateststructure"
    And check element by "id" "lateststructure", content contains "Latest Entries"
    And in section "id" "lateststructure", click on link with "id" "seeAllStructures"
    And check, browser "title" contains "RCSB PDB - Search Results"
    And check, browser "url" contains "results/results.do"
    And check element by "id" "SearchParameterText", content contains "This week's new structures"
    And list out the total number of search results
    And check the number of recent structure entries
    And check 404 from external file: "http://sandboxwest.rcsb.org:10601/ftp-v3-support/update-lists/added-entries"