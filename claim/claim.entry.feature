Feature: Enter a claim

Background:
Given HF with claim administrator is defined
Given the "Health facility claims page" is open
Given the Health facility and claim administrator are selected
Given the "Add" button was clicked

Rule: error message if mandatory information are missing 

Scenario: validation of the mandatory field
Given that no fields were filled 
When the "save" button is clicked
Then a message should appear to saying that the mandatory fields should be filled
And the mandatory fields should be highlighted in RED (Insurance Number, Claim No, Date claimed, Visit Date From, Visit Type, Main Diag)

Rule: check field entry validity

Scenario: enter the "insurance number"
When an "insurance number" is enter 
Then the system should check if there is an insuree with this "insurance number" 
And display an error message if the "insurance number"  doesn't exist

Scenario: enter the "Claim No"
When an "Claim No" is enter 
Then the system should check that the "Claim No" doesn't exist
And display an error message if the "Claim No" does already exist

Scenario: enter the "Visit Date From" 
Given "Visit Date To","Claimed Date" are set
When a date is entered in "Visit Date From"
And the focus leaves the cell
Then the system must check that the "Visit Date From" before or equal to today
And "Visit Date From" is before "Claimed Date"
And "Visit Date From" is before "Visit Date To" 

Scenario: enter the "Visit Date To" 
Given "Visit Date From","Claimed Date" are set
When a date is entered in "Visit Date To"
Then the system must check that the "Visit Date To" before or equal to today
And "Visit Date To" is before or equal "Claimed Date"
And "Visit Date To" is after "Visit Date From" 

Scenario: enter the "Claimed Date" 
Given "Visit Date From","Visit Date To" are set
And the focus leaves the cell
When a date is entered in "Claimed Date"
Then the system must check that the "Claimed Date" before or equal to today
And "Visit Date To" is before "Claimed Date"
And "Claimed Date" is after or equal "Visit Date From" 


Scenario: auto complete "Main Dg."
When text are enter in the "Main Dg." fields 
Then the system should propose Diagnoses in a drop down list where there is a matches between the text entered and the "Diag code" or "Diag description"

Scenario: select "Main Dg."
When text are enter in the "Main Dg." fields 
And the user select on of the Diagnosis from the drop down list
Then the system should should set the "Main Dg." fields with the selected Diagnosis


Rule: item and service can be added to the claim

Scenario: adding service
When the user add a service row
Then an empty service row should be created in the table

Scenario: adding item
When the user add a item row
Then an empty item row should be created in the table

Rule: dynamic update of the claim and service fields upon adding a service

Scenario: Auto complete "service code" of a service row
When text are enter in the "service code" fields 
Then the system should propose Services in a drop down list where there is a matches between the text entered and the "service code" or "service description"

Scenario: select "service code" of a service row
When text are enter in the "service code" fields 
And the user select on of the Service from the drop down list
Then the system should should set the "service code" fields with the selected Service
And set the "quantity" field of the row to 1
And adapt the "Price" field of the row
And adapt the "claimed"  field

Scenario: editing service row "quantity"
When user change the service row "quantity"
Then the system should should set the "quantity" field of the row to the entered value
And adapt the "claimed"  field

Scenario: editing the "price" of a service row
When user change the service "price"
Then the system should should set the "price" field of the row to the entered value
And adapt the "claimed"  field

Scenario: editing the service row "Explanation" field
When the user change the "Explanation" field of a service row
Then  the system should should set the "Explanation" field of the row to the entered value

Rule: dynamic update of the claim and Item fields upon adding an item

Scenario: Auto complete "item code" of a item row
When text are enter in the "item code" fields 
Then the system should propose items in a drop down list where there is a matches between the text entered and the "item code" or "item description"

Scenario: select "item code" of a item row
When text are enter in the "item code" fields 
And the user select on of the item from the drop down list
Then the system should should set the "item code" fields with the selected item
And set the "quantity" field of the row to 1
And set the "Price" field of the row
And adapt the "claimed"  field


Scenario: editing item row "quantity"
When user change the item row "quantity"
Then the system should should set the "quantity" field of the item row to the entered value
And adapt the "claimed"  field

Scenario: editing the "price" of a item row
When user change the Item "price"
Then the system should should set the "price" field of the item row to the entered value
And adapt the "claimed"  field

Scenario: editing the item row "Explanation" field
When the user change the "Explanation" field of a item row
Then  the system should should set the "Explanation" field of the item row to the entered value

Rule: saving a claim

Scenario: saving a claim
Given modularIMIS is used
When the user click on "Save"
Then the claim should saved

scenario: Refresh a saved claim
Given modularIMIS is used
Given that the claim was previously saved
When the user click on refresh
Then the "print" and "attachement" button should appear

 

