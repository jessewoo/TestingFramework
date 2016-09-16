Feature: RCSB Search
	In order to push poltergeist functionality for the RCSB site

	Scenario: Users can search for a specific item on RCSB
		Given a user goes to RCSB
		When they search in "top bar search" with "actin"
		Then RCSB should return results for "actin"
