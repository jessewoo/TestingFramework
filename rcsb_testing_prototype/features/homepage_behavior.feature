Feature: Browsing around the RCSB homepage
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: Name is a required field
    When I checkout leaving the name field blank
    Then I should see the error message "Name can't be blank"