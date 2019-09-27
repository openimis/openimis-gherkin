Feature: Upload of the list of locations

Background:
Given 0 in the location table
Given the "Registers page" is open

Scenario: insert only
When the locations_0.xls file is uploaded
And the strategy is set to "insert only"
And the "update" button is clicked
Then 20 record must be inserted in the location table

Scenario: update only
Given "insert only" scenario was successful
When the locations_1.xls file is uploaded
And the strategy is set to "update only"
And the "update" button is clicked
Then 3 record must be updated in the location table

Scenario: insert and update
Given "insert only" scenario was successful
Given "update only" scenario was successful
When the locations_2.xls file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 2 record must be updated in the location table
And  4 record must be inserted in the location table

Scenario: insert, update and Delete
Given "insert only" scenario was successful
Given "update only" scenario was successful
Given "insert And update" scenario was successful
When the locations_4.xls file is uploaded
And the strategy is set to "insert And update"
And the "update" button is clicked
Then 1 record must be updated in the location table
And  3 record must be inserted in the location table
And  5 record must be deleted in the location table