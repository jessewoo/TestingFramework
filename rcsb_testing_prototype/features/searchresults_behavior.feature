Feature: Browsing around the RCSB Search Results Page
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: User search for a specific item on RCSB
    When they search for "actin"
  	Then RCSB should return results for "actin"