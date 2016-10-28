Feature: RCSB Search functionality

Scenario Outline: Users search for a variety of items
   Given a user goes to RCSB
   When the user looks for "<query>"
   Then the results returned will display "<query>"
 
   Examples:
   |query|
   |hemoglobin|
   |hiv|
   |1stp|
   |4hhb|