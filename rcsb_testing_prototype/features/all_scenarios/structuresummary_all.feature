Feature: Browsing a typical Structure Summary Page for RCSB
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario: User click on "Advanced Search" link to perform a sequence search
    When they search for "4hhb"
    Then RCSB should show structure summary page for "4hhb"
    