Feature: Reviewing claim(s)

Background:
Given @HF1 defined
Given the "Claim Overview page" is open
 
Rule: update on the claim must be taken into account

Scenario: adding an adjustment reason on the claim level
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the review page is open for the claim @CM1 
When the user add a text in the claim @CM1  'Adjustement' fields
And the user save the claim @CM1 
Then the text entered in the claim @CM1  'Adjustement' fields must be saved

Scenario: adding an adjustment reason on the claim Item level
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Item @IM1
And the review page is open for the claim @CM1 
When the user add a text in the claim Item @IM1  'Adjustement' fields
And the user save the claim @CM1 
Then the text entered in the claim Item @IM1  'Adjustement' fields must be saved

Scenario: adding an adjustment reason on the claim Service level
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Service @SC1
And the review page is open for the claim @CM1 
When the user add a text in the claim Service @SC1  'Adjustement' fields
And the user save the claim @CM1 
Then the text entered in the claim Service @SC1  'Adjustement' fields must be saved

Scenario: Changing the approved Quantity of an Item
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Item @IM1
And the review page is open for the claim @CM1 
When the user change the 'App. quantity' of the claim Item @IM1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new item total : 'App. Quantity * Price'
And the 'App. quantity' is saved

Scenario: Changing the approved Quantity and the approaved price of an Item
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Item @IM1
And the review page is open for the claim @CM1 
When the user change the 'App. Price' and the 'App. quantity' of the claim Item @IM1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new item total : 'App. Quantity * App. Price'
And the 'App. Price' is saved
And the 'App. quantity' is saved

Scenario: Changing the approved price of an Item
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Item @IM1
And the review page is open for the claim @CM1 
When the user change the 'App. Price' of the claim Item @IM1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new item total : 'Quantity * App. Price'
And the 'App. Price' is saved


Scenario: Changing the approved Quantity of an Service
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Service @SC1
And the review page is open for the claim @CM1 
When the user change the 'App. quantity' of the claim Service @SC1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new Service total : 'App. Quantity * Price'
And the 'App. Price' is saved

Scenario: Changing the approved Quantity and the approaved price of an Service
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Service @SC1
And the review page is open for the claim @CM1 
When the user change the 'App. Price' and the 'App. quantity' of the claim Service @SC1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new Service total : 'App. Quantity * App. Price'
And the 'App. Price' is saved
And the 'App. quantity' is saved

Scenario: Changing the approved price of an Service
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
And the claim @CM1 has a non-rejected Service @SC1
And the review page is open for the claim @CM1 
When the user change the 'App. Price' of the claim Service @SC1  
And the user save the claim @CM1 
Then the 'Total approved' need to be updated the the new Service total : ' Quantity *  App. Price'
And the 'App. quantity' is saved

Rule: data from the HF cannot be modified 

Scenario: Changing data entered a the HF
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
When the user try to change 'Health Facility', 'Insuree ID','Name','Visit Date From','Visit Date To','Date Claimed', 'Visit Type', 'Main Diagnosis', 'Claim No. ', 'guarantee No.', 'Claimed', 'Sec Dg1', 'Sec Dg2', 'Sec Dg3', 'Sec Dg4', 'Claim Administrator', 'Explaination'
Then he should be blocked (not editable fields)

Rule: Saving a claim review

Scenario: Savien a claim review
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
When the user click on the 'Save' button 
Then the claim @CM1 is saved

Scenario: Submitting a claim review
Given the claim @CM1 is in "Checked" status 
And the claim @CM1  is "selected for review"
When the user click on the 'Review' button 
Then the claim @CM1 is marked as review 
And the reviey cannot be updated

