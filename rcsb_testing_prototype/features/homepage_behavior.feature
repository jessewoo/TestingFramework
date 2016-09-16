Feature: Browsing around the RCSB homepage
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: Click on Molecule of the Month
    When I click on Molecule of the Month image headless
    Then I should be redirected to PDB101 page

  Scenario: Making https site
  	Given I am on https rcsb.org site
    Then I should get a empty page
