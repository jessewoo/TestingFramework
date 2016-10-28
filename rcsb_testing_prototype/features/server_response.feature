Feature: Server Health Check
     
  Scenario: Server Up
    Given Admin is on the rcsb.org status page
    Then Admin should see server response

  Scenario: Server Initiated
    Given Admin is on the rcsb.org summary json page
    Then Admin should see homo-sapiens data


  Scenario: Check Robot Settings
    Given Admin is on the rcsb.org robots.txt page

  Scenario: Check Redirects
