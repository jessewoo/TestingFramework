# ON TERMINAL: cucumber features/Rcsb_Search.feature
Feature: Rcsb Search Functionality

Scenario: Users can search for a specific item on Rcsb
  Given a user goes to Rcsb Homepage
  When they search on top bar for "actin"
  Then Rcsb SRP should return results for "actin"