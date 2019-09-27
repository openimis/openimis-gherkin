Feature: premium (contribution) payment

Background:
Given enrollment @EO1 is define and has sufficient right to add contribution for the district @DS1
Given the "Families/Groups page" is open


Rule: add the full contribution on a policy

Scenario: Submitting a payment without unique receipt number
Given the policy is selected
When the payment details are entered
And the receipt number entered is not unique in openIMIS
Then the user must receive an error saying that the receipt number is not unique  

Scenario: Submitting a payment without unique receipt number
Given the policy is selected
When the payment details are entered
And the receipt number entered is  unique in openIMIS
And the payment is the same amount as the policy value
Then the user must receive a message saying that the payment was registered and that the policy is activated 

Rule: add a partial contribution on a policy

Rule: add a contribution on an policy with the value already paid








