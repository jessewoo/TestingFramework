Feature: Browsing around the RCSB homepage
     
  Background:
    Given I am on the rcsb.org site

  Scenario: Click on the Welcome Panels
    When I click on various welcome panels
    And I click on the advertised event on the Welcome Panel
    Then I should be redirected to the link
    