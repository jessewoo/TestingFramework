Feature: Browsing a typical Structure Summary Page for RCSB
     
  Background:
    Given I am on the rcsb.org site
       
  Scenario Outline: User does multiple searches
    When they search for "<pdbid>"
    Then RCSB should show structure summary page for "<pdbid>" with this "<reason>"

  Examples:
    |pdbid      |reason   |
    # |2LV0       |nmr      | 
    # |1STP       |common   | 
    # |4EAR       |common   |
    |4IYQ       |common   |  
    |2HYV       |common   |  
    # |4INU       |common   |  
    # |2W6E       |common   |  
    |4HHB       |common   |
    
  Scenario: User utilize the 3D View page
    When they search for "1BTN"
    Then user click on the 3D View tab
    And user should see the Jmol page for the "1BTN"
    And user can change the Jmol view of the 3D structure
    And user selects the NGL view for "1BTN"




  # Scenario: User try out 3D View page - WebGl

  # Scenario: User try out 3D View page - NGL
