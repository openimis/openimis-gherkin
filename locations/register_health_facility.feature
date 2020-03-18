Feature: Upload of the list of health facility

Background:
Given 0 in the health facility table
Given the "Registers page" is open

Scenario: insert only
When the health_facilitys_0.xls file is uploaded
And the strategy is set to "insert only"
And the "update" button is clicked
Then 20 record must be inserted in the health facility table

Scenario: update only
Given "insert only" scenario was successful
When the health_facilitys_1.xls file is uploaded
And the strategy is set to "update only"
And the "update" button is clicked
Then 3 record must be updated in the health facility table

Scenario: insert and update
Given "insert only" scenario was successful
Given "update only" scenario was successful
When the health_facilitys_2.xls file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 2 record must be updated in the health facility table
And  4 record must be inserted in the health facility table

Scenario: insert, update and Delete
Given "insert only" scenario was successful
Given "update only" scenario was successful
Given "insert And update" scenario was successful
When the health_facilitys_4.xls file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 1 record must be updated in the health facility table
And  3 record must be inserted in the health facility table
And  5 record must be deleted in the health facility table
