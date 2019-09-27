Feature: load claim(s)

Background:
Given Health facility @HF1 defined
Given there is a claims @CM1 on @HF1
Given the "Health facility claims page" is open


Rule : select a claim

Scenario: Select a claim
Given  a search provided results for claim on @HF1, including @CM1 claim
When the user click on @CM1 claim row in the result area
Then the claim should be highlighted

Rule: load a selected claims

Scenario: Select a claim with load button
Given a search provided results for claim on @HF1, including @CM1 claim
When the user click on @CM1 claim row in the result area
And the user click on the "load" button
Then the claim screen should be loaded with the @CM1 claim details

Scenario: Select a claim directly by clicking on the active part of the row
Given a search provided results for claim on @HF1, including @CM1 claim
When the user click on the active part @CM1 claim row in the result area (first column in openIMIS legacy)
Then the claim screen should be loaded with the @CM1 claim details
