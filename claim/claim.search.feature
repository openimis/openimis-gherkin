Feature: Searching claim(s)

Background:
Given Health facility @HF1 defined
Given there is claims with [entered] status on @HF1
Given there is claims between @date1 and @date2 on @HF1
Given the "Health facility claims page" is open
 
Rule : the filter selected must be taken into account

Scenario: Searching [Entered] claim for the Heath Facility @HF1
When the user select [Entered] in the "claim status" list 
And the user select @HF1 in the "HF code" field 
And click on the "Search" button
Then All and only the claims for the HF @HF1 with the status [Entered] must be present in the result area in a paged manner
And the number of claim found must be displayed before "Claims found" Area

Scenario: Searching claims for the Heath Facility @HF1 claimed between @date1 and @date2
When the user pick @date1 in the "Claim  Date From" date picker
And the user pick @date2 in the "Claim  Date To" date picker
And the user select @HF1 in the "HF code" field 
And click on the "Search" button
Then All and only the claims for the HF @HF1 between @date1 and @date2 must be present in the result area in a paged manner
And the number of claim found must be displayed before "Claims found" Area

