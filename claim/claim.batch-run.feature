Feature: claim Batch run

Background:
Given @HF1 is defined
Given @RG1 is defined
Given @DS1 is defined
Given the "Claim Processing page" is open
Given that the user have enough right to access the page (run/search and preview claims)
 
Rule : Run a claim processing batch

Scenario: Running a claim batch for the region @RG1 for the month @MN1 of the year @YR1
Given there is claims with [Valuated] status for the region @RG1 claimed on the month @MN1 of the year @YR1
When the user select @RG1 in the "Region"  drop-down list 
And the user pick @YR1 in the "Year" drop-down list
And the user pick @MN1 in the "Month" drop-down list
And click on the "Process" button
Then a claim batch  should be created including the claims claimed on the month @MN1 of the year @YR1 for the region @RG1

Scenario: Running a claim batch for the district @DS1 of the region @RG1 for the month @MN1 of the year @YR1
Given there is claims with [Valuated] status for the region @RG1 claimed on the month @MN1 of the year @YR1
When the user select @RG1 in the "Region"  drop-down list 
And the user pick @DS1 in the "District" drop-down list
And the user pick @YR1 in the "Year" drop-down list
And the user pick @MN1 in the "Month" drop-down list
And click on the "Process" button
Then a batch run should be created including the claims claimed on the month @MN1 of the year @YR1 for the district @DS1

Rule : Search for previously executed batch runs

Scenario: Product list restriction based on Region
Given that there is product defined for the national level
When the user select 'Monthly' in the "Type" drop-down-list
And the user select 'National' in the "Region" drop-down-list
Then only national product should be display in the "Product" drop-down-list

Scenario: search all the batch for hospitals
Given that there is claim batch run for 'Hospital'
When the user select 'Monthly' in the "Type" drop-down-list
And the user select 'Hospital' in the "Category" drop-down-list
And the user click on "Filter"
Then only the batch for 'Hospital' should be displayed in the "Display" zone.

Scenario: Search for the claim batch for the district @DS1 of the region @RG1 for the month @MN1 of the year @YR1
Given the claim batch for the district @DS1 of the region @RG1 for the month @MN1 of the year @YR1 was previously generated
When the user select 'Monthly' in the "Type" drop-down-list
And the user select  @RG1 in the "region" drop-down-list
And the user select  @DS1 in the "district" drop-down-list
And the user select  @YR1 in the "year" drop-down-list
And the user select  @MN1 in the "month" drop-down-list
And the user click on "Filter"
Then only the batch for this district and the month @MN1 and year @YR1 should be displayed in the "Display" zone

Scenario: Search for the claim batch for for the month @MN1 of the year @YR1
Given the claim batch for the month @MN1 of the year @YR1 were previously generated
When the user select 'Monthly' in the "Type" drop-down-list
And the user select  @YR1 in the "year" drop-down-list
And the user select  @MN1 in the "month" drop-down-list
And the user click on "Filter"
Then only the batch for the month @MN1 and year @YR1 should be displayed in the "Display" zone

Rule : filter for account 

Scenario: get the batch content details for batch @BR1 run for the district @DS1 of the region @RG1 for the month @MN1 of the year @YR1
Given that the batch @BR1 was run
When 'HF' is selected in the "Group By" radio buttons
And the check-box "Show Claims" is NOT selected
And the user select  @RG1 in the "region" drop-down-list
And the user select  @DS1 in the "district" drop-down-list
And the user select the batch @BR1 in the "batch" drop-down-list with the format @YR1-@MN1
And the user click on "Preview"
Then the report showing the claim amount grouped by 'HF' for the batch @BR1 must be loaded

Scenario: Get the details of the claims of the batches for the district @DS1 part of the region @RG1 between the date @DT1 and @DT2
Given that there is claims included in batch the district @DS1 between the date @DT1 and @DT2
When the check-box "Show Claims" is selected
And the user select @RG1 in the "region" drop-down-list
And the user select @DS1 in the "district" drop-down-list
And the user select @DT1 in the "Date From" date picker
And the user select @DT2 in the  "Date To" date picker
And the user click on "Preview"
Then the report showing the claims details or the district @DS1  between the date @DT1 and @DT2 must be loaded

#[Not supported] Scenario: User without the Authority Claims/search shouldn't see the claim details
#Given the user doesn't have the Claims/search Authority 
#Then the  check-box "Show Claims" shouldn't be selectable


