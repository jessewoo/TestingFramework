Feature: Basic Test Suite for RCSB
     
  Background:
    Given user is on rcsb.org
       
  Scenario: Homepage User Interface Spot Checks
    When I check, the structure count will be displayed
    And I should see the Welcome panel
    And there should be structures in 'Lastest Entries' section
    And there should be data in 'Features & Highlights' section
    And there should be news in 'News' section
    And data should exist in 'PDB at a Glance' section
    And I click on Molecule of the Month image
    Then I should be redirected to PDB101 page

  Scenario: Homepage Search Drilldown User Flow
    When I click on the Search Panel Subnavigation
    And I click on the Homo Sapien category
    Then RCSB should return drilldown results for "Homo sapiens"

  Scenario: Advanced Search Completion to Results Page
    When I click on the Advanced Search link underneath Search Bar
    And I search by multiple Pdb Ids of "4HHB, 2CPK"
    Then RCSB should return specific PDB IDs for "4HHB, 2CPK"

  Scenario: Search Results User Flow
    When they search for "collagen"
    Then RCSB should return results for "collagen"

  Scenario: All Structures Results Page
    When a user clicks on the structure count
    Then user should be shown All Structures

  Scenario: Structure Summary Page Interface Spot Checks
    When they search for "1STP"
    Then RCSB should show structure summary page for "1STP"
    And there should be a carousel gallery section
    And there should be a macromolecule data section 
    And there should be a data in literature section 
    And there should be a data in deposit section
    And there should be a data in small molecule section
    And there should be a data in methods section