Feature: Doing an "Advanced Search" query on RCSB
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: User click on "Advanced Search" link to perform a sequence search
    When I click on the Advanced Search link underneath Search Bar
    And I insert Human sequence for sequence search
    Then I should be redirected to the search results with entity data
    And the first result should have an entity comparison
    And scrolling down, the last result should have an entity comparison