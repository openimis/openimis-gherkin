Feature: Submitting claim(s)

Background:
Given HF with claim administrator is defined
Given the "Health facility claims page" is open
Given the Health facility and claim administrator are selected
Given the claim status filter is set to [Entered]
Given the "search" button was clicked

Rule: Submitting the selected claim


Scenario: Submitting a valid claim
Given a [entered] claim @S1 was selected
Given that claim @S1 respect the product rules for all its (3) Services  and  (3) Items
# @A need to refer to a claim in the demo database
When the user click on the "Submit" button
Then the number of submitted claim  (1) is displayed on the user portal
And the number of checked claim  (1) is displayed on the user portal
And the number of submitted service  (3) is displayed on the user portal
And the number of checked service  (3) is displayed on the user portal
And the number of submitted Items (3) is displayed on the user portal
And the number of checked claim  (3) is displayed on the user portal


Scenario: Submitting a partially valid claim
Given a [entered] claim @S2 was selected
Given that claim @S2 respect the product rules for all its (3) Services  and  (2) out of the (3) Items
When the user click on the "Submit" button
Then the number of submitted claim  (1) is displayed on the user portal
And the number of checked claim  (1) is displayed on the user portal
And the number of submitted service  (3) is displayed on the user portal
And the number of checked service  (3) is displayed on the user portal
And the number of submitted Items (3) is displayed on the user portal
And the number of checked claim  (2) is displayed on the user portal
And the number of rejected claim  (1) is displayed on the user portal

Scenario: Submitting a none valid claim
Given a [entered] claim @S3 was selected
Given that claim @S3 doesn't respect the product rules for all its (3) Services  and  (3) Items
When the user click on the "Submit" button
Then the number of submitted claim  (1) is displayed on the user portal
And the number of Rejected claim  (1) is displayed on the user portal
And the number of submitted service  (3) is displayed on the user portal
And the number of Rejected service  (3) is displayed on the user portal
And the number of submitted Items (3) is displayed on the user portal
And the number of rejected claim  (3)  is displayed on the user portal


Rule:Submitting multiple claim

Scenario: Submitting the a single claim
Given the checkbox of an [entered] claim @S4 was ticked
When the user click on the "Submit" button
Then the number of submitted claim  (1) is displayed on the user portal
And the number of checked claim  (1) is displayed on the user portal
And the number of submitted service  (3) is displayed on the user portal
And the number of checked service  (3) is displayed on the user portal
And the number of submitted Items (3) is displayed on the user portal
And the number of checked claim  (3) is displayed on the user portal

Scenario: Submitting multiple claim
Given [entered] claim @S8 was ticked
When the "Selected To Submit" checkbox is ticked
Then all the [entered] claims from the result area have their checkbox ticked

Scenario: Submitting multiple claim
Given the checkbox of an [entered] claim @S5 was ticked
Given the checkbox of an [entered] claim @S6 was ticked
Given the checkbox of an [entered] claim @S7 was ticked
When the user click on the "Submit" button
Then the number of submitted claim  (3) is displayed on the user portal
And the number of checked claim  (3) is displayed on the user portal
And the number of submitted service  (9) is displayed on the user portal
And the number of checked service  (9) is displayed on the user portal
And the number of submitted Items (9) is displayed on the user portal
And the number of checked claim  (9) is displayed on the user portal


