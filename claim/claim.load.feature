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

Rule: print a claim

Scenario: print a claim
Given that a claim @CM1 is loaded
When the user click on the print button, 
Then  a PDF version of the claim should be generated 
And the download should start

Rule: add attachement

Scenario: add attachement screen 
Given that a claim @CM1 is loaded
When the user click and the attachement button
Then the "attachement" modal need to apear

Scenario:  set data for the attached file
Given that a claim @CM1 is loaded
And the "add attachement screen" is displayed
When the user enter the "Title", "Type", "Date"
And click on the "+"
Then the windows to select a file should appear

Scenario: attach a file
Given that a claim @CM1 is loaded
And the "add attachement screen" is displayed 
And that the "windows to select a file" appeared
When the user select a file
Then the file is added to the claim with the "Title", "Type", "Date" provided by the user
