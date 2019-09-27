Feature: Upload of the list of diagnoses

Background:
Given 0 in the diagnose table
Given the "Registers page" is open (to have "Registers.aspx" in the "referer" header part in the next steps)

Scenario: insert only
When the diagnoses_0.xml file is uploaded
And the strategy is set to "insert only"
And the "update" button is clicked
Then 20 record must be inserted in the diagnose table

Scenario: update only
Given "insert only" scenario was successful
When the diagnoses_1.xml file is uploaded
And the strategy is set to "update only"
And the "update" button is clicked
Then 3 record must be updated in the diagnose table

Scenario: insert and update
Given "insert only" scenario was successful
Given "update only" scenario was successful
When the diagnoses_2.xml file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 2 record must be updated in the diagnose table
And  4 record must be inserted in the diagnose table

Scenario: insert, update and Delete
Given "insert only" scenario was successful
Given "update only" scenario was successful
Given "insert And update" scenario was successful
When the diagnoses_4.xml file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 1 record must be updated in the diagnose table
And  3 record must be inserted in the diagnose table
And  5 record must be deleted in the diagnose table