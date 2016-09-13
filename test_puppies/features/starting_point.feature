Feature: Adopting puppies
 
  Background:
    Given I am on the puppy adoption site

  Scenario: Adopting a puppy using partial default data 
    When I click the View Details button for "Brook" 
    And I click the Adopt Me button
    And I click the Complete the Adoption button
    And I complete the adoption using a Credit card 
    Then I should see "Thank you for adopting a puppy!"
