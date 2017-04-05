Feature: Quick Check of Legacy Ligand Pages

#  Set the URL in the command line
#  cucumber features/test_suites/quickchecks_ligands.feature URL=www3.rcsb.org
  Scenario: Ligands Summary Page - Check Ligands IDs
    Given "ligands", check 404 from file: "/features/support/files/ligands.txt" with legacy RCSB domain