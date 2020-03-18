Feature: Reviewing claim(s)

Background:
Given @HF1 defined
Given the "Claim Overview page" is open
 
Rule : the filter selected must be taken into account

Scenario: Searching [Checked] claim for the Heath Facility @HF1 claimed between @date1 and @date2
Given there is claims with [Checked] status on @HF1 claimed between @date1 and @date2 on @HF1
When the user select [Checked] in the "claim status" list 
And the user select @HF1 in the "HF code" field 
And the user pick @date1 in the "Claim  Date From" date picker
And the user pick @date2 in the "Claim  Date To" date picker
And click on the "Search" button
Then All and only the claims for the HF @HF1 with the status [Checked] claimed between @date1 and @date2 must be present in the result area in a paged manner
And the number of claim found must be displayed before "Claims found" Area

Rule: Claim selection update should [idle] review status to [selected]

Scenario: Selecting all the claim with a value above @val1 for review
Given the user have a Claim administrator role
Given there is claims with [Checked] status on @HF1 and with the review status to [idle]
When the user select [review select] in "criteria details" in the Claim selection update
And checked the "Value" check box 
And  enter the the @val1 in the value fields
And click on update
Then the claim with [idle] in the review status and having a "value" above @val1 should have their review status updated to [Selected for feedback]

Scenario: Selecting all the claim with a value above the mean + @var1 variance
Given the user have a Claim administrator role
Given there is claims with [Checked] status on @HF1 and with the review status to [idle]
When the user select [review select] in "criteria details" in the Claim selection update
And checked the "Variance" check box 
And  enter the the @var1 in the value fields
And click on update
Then the claim with [idle] in the review status and having a value above the mean + @var1 variance should have their review status updated to [Selected for feedback]

Scenario: Selecting @per1 percent of the claim 
Given the user have a Claim administrator role
And there is claims with [Checked] status on @HF1 and with the review status to [idle]
When the user select [review select] in "criteria details" in the Claim selection update
And checked the "Variance" check box 
And  enter the the @var1 in the value fields
And click on update
Then the claim with [idle] in the review status and having a "Variance" above @var1 should have their review status updated to [Selected for feedback]

Rule: Claim selection update should [idle] feedback status to [selected]

Scenario: Selecting all the claim with a value above @val1 for feedback
Given the user have a Claim administrator role
And there is claims with [Checked] status on @HF1 and with the feedback status to [idle]
When the user select [feedback select] in "criteria details" in the Claim selection update
And checked the "Value" check box 
And  enter the the @val1 in the value fields
And click on update
Then the claim with [idle] in the feedback status and having a "value" above @val1 should have their feedback status updated to [Selected for feedback]

Scenario: Selecting all the claim with a value above the mean + @var1 variance
Given the user have a Claim administrator role
And there is claims with [Checked] status on @HF1 and with the feedback status to [idle]
When the user select [feedback select] in "criteria details" in the Claim selection update
And checked the "Variance" check box 
And  enter the the @var1 in the value fields
And click on update
Then the claim with [idle] in the feedback status and having a value above the mean + @var1 variance should have their feedback status updated to [Selected for feedback]

Scenario: Selecting @per1 percent of the claim 
Given the user have a Claim administrator role
And there is claims with [Checked] status on @HF1 and with the feedback status to [idle]
When the user select [feedback select] in "criteria details" in the Claim selection update
And checked the "Variance" check box 
And  enter the the @var1 in the value fields
And click on update
Then the claim with [idle] in the feedback status and having a "Variance" above @var1 should have their feedback status updated to [Selected for feedback]

