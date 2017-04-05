Feature: Text Search using SOLR for Legacy RCSB.org

  # EXECUTION: cucumber URL=searchprotowest.rcsb.org features/legacy_rcsb_textsearch_SOLR.feature:4
  Scenario: Passing URL argument to command line execution
    Given connect to "ENV['URL']"
    And search for "hiv" with match type "broad"
    And check element by "id" "SearchParameterText", content contains "hiv"
    And list out the total number of search results
    And search for "hiv" with match type "phrase"
    And list out the total number of search results

  # EXECUTION: cucumber URL=searchprotowest.rcsb.org features/legacy_rcsb_textsearch_SOLR.feature:13
  Scenario Outline: Search results for several search terms with varying match types
    Given connect to "ENV['URL']"
    And search for "<search_term>" with match type "<search_match_type>"
    And check element by "id" "SearchParameterText", content contains "<search_term>"
    And list out the total number of search results
    And select option with "value" "listedPdbIds" in dropdown with "id" "generateReports"
#   NOTE: Need to allow popups in browser
    And check, browser "url" contains "pdb/resultsV2/sids.jsp?qrid="
#    And save web page with filename of "<search_term>" including "<search_match_type>"

    Examples:
      | search_term       | search_match_type |
      | cystic fibrosis   | broad             |
      | Cystic Fibrosis | phrase            |
      | sitagliptin       | broad             |
      | sitagliptin       | phrase             |
      | Beta-lactamase    | broad             |
      | Beta-lactamase    | phrase             |
      | helix bundle      | broad             |
      | helix bundle      | phrase             |
      | lyme disease | broad                  |
      | lyme disease | phrase                  |
      | sigma factor | broad                  |
      | sigma factor | phrase                  |
      | gonorrhea    | broad                  |
      | gonorrhea    | phrase                  |
      | Neisseria gonorrhoeae | broad   |
      | Neisseria gonorrhoeae | phrase   |
      | deoxy hemoglobin    | broad   |
      | deoxy hemoglobin    | phrase   |
      | free electron laser | broad  |
      | free electron laser | phrase  |
      | HIV capsid          | broad  |
      | HIV capsid          | phrase  |

  # EXECUTION: cucumber features/legacy_rcsb_textsearch_SOLR.feature:49
  Scenario Outline: Testing out Phrase Search
    Given connect to "searchprotowest.rcsb.org"
    And search for "<search_term>" with match type "<search_match_type>"
    And check element by "id" "SearchParameterText", content contains "<search_term>"
    And list out the total number of search results

    Examples:
      | search_term         | search_match_type |
      | deoxy hemoglobin    | broad             |
      | deoxy hemoglobin    | phrase            |