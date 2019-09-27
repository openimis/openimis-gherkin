Feature: Restoring claim(s)

Background:
Given HF with claim administrator is defined
Given the "Health facility claims page" is open
Given the Health facility and claim administrator are selected
Given the "search" button was clicked

Rule: restoring a rejected claim should copy all fields and add a "@" prefix to the "claim No"


Scenario: restoring rejected claim
Given a [rejected] claim @R1 was selected
Given the "load" button was clicked
Given the claim @R1 is properly loaded
When the user click on the "Restore" button
Then the new claim @B screen should be loaded with : "HF Code", "HF Name", "insurance number" , "Patient Name", "Main Dg.","Date Claimed","Sec Dg1","Sec Dg2","Sec Dg3","Sec Dg4","Claim Administrator, Guarantee No","Visit Date From","Visit Date To" and "Visit Type" from claim @R1
Then All services rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R1
And All Items rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R1
Then "Claimed" should be calculated
But  "Claim No" should be the one from claim @R1 with a "@" prefix

Rule:restoring a not rejected claim should copy all fields but "Claim No","insurance number" and "Patient Name" that need to remain empty


Scenario: restoring entered claim
Given a not [entered] claim @R2 was selected
Given the "load" button was clicked
Given the claim @R2 is properly loaded
When the user click on the "Restore" button
Then the new claim @R2 screen should be loaded with :  "HF Code", "HF Name", , "Main Dg.", "Date Claimed","Sec Dg1","Sec Dg2","Sec Dg3","Sec Dg4","Claim Administrator, Guarantee No","Visit Date From","Visit Date To" and "Visit Type" from claim @R2
Then All services rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R2
And All Items rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R2
Then "Claimed" should be calculated
But "Claim No","insurance number" and "Patient Name" should remain empty

Scenario: restoring valuated claim
Given a not [valuated] claim @R3 was selected
Given the "load" button was clicked
Given the claim @R3 is properly loaded
When the user click on the "Restore" button
Then the new claim @R3 screen should be loaded with : "HF Code", "HF Name", , "Main Dg.", "Date Claimed","Sec Dg1","Sec Dg2","Sec Dg3","Sec Dg4","Claim Administrator, Guarantee No","Visit Date From","Visit Date To" and "Visit Type" from claim @R3
Then All services rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R3
And All Items rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R3
Then "Claimed" should be calculated
But "Claim No","insurance number" and "Patient Name" should remain empty

Scenario: restoring checked claim
Given a not [checked] claim @R4 was selected
Given the "load" button was clicked
Given the claim @R4 is properly loaded
When the user click on the "Restore" button
Then the new claim @R4 screen should be loaded with : "HF Code", "HF Name", , "Main Dg.", "Date Claimed","Sec Dg1","Sec Dg2","Sec Dg3","Sec Dg4","Claim Administrator, Guarantee No","Visit Date From","Visit Date To" and "Visit Type" from claim @R4
Then All services rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R4
And All Items rows fields ("SERVICE CODE","QUANTITY","PRICE" and "EXPLAINATION") from claim @R4
Then "Claimed" should be calculated
But "Claim No","insurance number" and "Patient Name" should remain empty