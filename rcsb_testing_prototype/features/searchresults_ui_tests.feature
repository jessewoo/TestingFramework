Feature: Browsing around the RCSB Search Results Page
     
  Background:
    Given I am on the rcsb.org site
  	
  Scenario: User searching and downloading PDB files
    When they search for "virus"
    Then RCSB should return results for "virus"
    And user can select some of the PDBIDs
    And user can download some of the PDBIDs
    And user is on the batch download page
    
  Scenario: User searching and generate a structure report
    When they search for "actin"
    Then RCSB should return results for "actin"
    And user can select some of the PDBIDs
    And user can generate a structure report