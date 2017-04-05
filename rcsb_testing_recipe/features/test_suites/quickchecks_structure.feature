Feature: Quick Check of Legacy Structure Pages

#  Set the URL in the command line
#  cucumber features/test_suites/quickchecks_structure.feature URL=www.rcsb.org
  Scenario: Structure Summary Page - Check PDB IDs
    Given "structures", check 404 from file: "/features/support/files/structures.txt" with legacy RCSB domain

  Scenario: Check RECENT Added Structure Summary Page - Check PDB IDs - External PDB IDs
    Given "structures", check 404 from external file: "http://sandboxwest.rcsb.org:10601/ftp-v3-support/update-lists/added-entries" with legacy RCSB domain