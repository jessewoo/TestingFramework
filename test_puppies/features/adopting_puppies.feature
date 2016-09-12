Feature: Adopting puppies
     
  Background:
    Given I am on the puppy adoption site
       
  Scenario: Name is a required field
    When I checkout leaving the name field blank
    Then I should see the error message "Name can't be blank"


  Scenario: Verify message when adoption is processed
    Given I have a pending adoption for "Tom Jones"
    When I process that adoption
    Then I should see "Please thank Tom Jones for the order!"