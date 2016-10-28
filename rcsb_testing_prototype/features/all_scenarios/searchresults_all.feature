Feature: Browsing around the RCSB Search Results Page
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: User search for a specific item on RCSB - Changing the views and filters
    When they search for "actin"
    Then RCSB should return results for "actin"
    And user can filter results related to "actin"
  	
  Scenario: User search for a specific item on RCSB - Different tabs
    When they search for "hiv"
    Then RCSB should return results for "hiv"
    And user can view other tabs related to "hiv"
    
  Scenario: All Structures Search Results
    When a user clicks on the structure count
    Then user should be shown All Structures  

  Scenario Outline: User searches for multiple items
    When they search for "<query>"
    Then RCSB should return results for "<query>"

  Examples:
    |query        |
    |hemoglobin   |
    |1stp         |  
  