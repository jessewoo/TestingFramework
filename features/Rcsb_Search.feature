Feature: RCSB Search functionality

Scenario: Users can search for a specific item on RCSB
  Given a user goes to RCSB
  When they search for "actin"
  Then RCSB should return results for "actin"

# Scenario Outline: Users search for a variety of items
#   Given a user goes to RCSB
#   When the user looks for <query>
#   Then the results returned will display <query>
# 
#   Examples:
#   |query|
#   |hemoglobin|
#   |hiv|
#   |1stp|
#   |4hhb|
#   |3j3q|
#   |HEM|
#   |cat|
#   |Peter|
#   |Cole Christie|
#   |Abcdefghi|