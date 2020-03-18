Feature: Health facility CRUD

Rule: Create HF

Scenario: open the creation page
Given the user is connected to openIMIS
And the user is on the HF search page
When the user click on the 'add' button
Then the new HF page load

Scenario: Mandatory fields must be selected
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
When the user try to save the HF without on of the mandatory field filled
Then saving the claim shouldn't be possible

Scenario: selection of Item price list
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
When the user click on the selection box for the 'item price list'
Then the user should be able to chose one 'Item price list'

Scenario: Selection or service price list
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
When the user click on the selection box for the 'Service price list'
Then the user should be able to chose one 'Service price list'

Scenario: Catchement definition : Region
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
When the user select a 'region'
Then the 'district' under that 'region' should appear in the 'district' column

Scenario: Catchement definition : District
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
And 'Regions' catchement is selected
When the user select a 'district'
Then the 'Municipalities' under that 'district' should appear in the 'Municipalities' column

Scenario: Catchement definition : Municipalities
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
And 'Regions' catchement is selected
And 'Districts' catchement is selected
When the user select a 'Municipalities'
Then the 'Villages' under that 'Municipalities' should appear in the 'Village' column 
And the 'precentage of catchement' per village is editable

Scenario: Catchement definition : villages
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
And 'Regions' catchement is selected
And 'Districts' catchement is selected
And 'Municipalities' catchement is selected
When the user enter a 'percentage of catchement' for a village
Then the data entered should be kept until the page is open even if the user enter 'percentage of catchement' for other region/district/municipalities




Scenario: Saving an HF
Given the user is connected to openIMIS
And a the 'create HF page' is open
And the mandatory fields are filled
When the user click on 'Save'
Then the HF must be saved

Rule: Search HF

Scenario: Search by region HF
Given the user is connected to openIMIS
And the user is on the HF search page
When the user select a region in the 'region' fields
And launch the search
Then list of HF must be part of the selected 'region'

Scenario: Search by District HF
Given the user is connected to openIMIS
And the user is on the HF search page
When the user select a District in the 'District' fields
And launch the search
Then list of HF must be part of the selected 'District'

Scenario: Search by other choice list
Given the user is connected to openIMIS
And the user is on the HF search page
When the user select an option  in the 'Legal form','Level','care type' fields
And launch the search
Then list of HF must be part of the selected 'Legal form','Level','care type'

Scenario: Search by other specific
Given the user is connected to openIMIS
And the user is on the HF search page
When the user enter text in the 'Code','Name','Phone', 'Fax', 'email' fields
And launch the search
Then list of HF must have the entered text in its 'Code','Name','Phone', 'Fax', 'email', fields

Scenario: search with historical value
Given the user is connected to openIMIS
And the user is on the HF search page
When the user check the box historical value 
And launch the search
Then all the version of the HF matching the search criteria must be displayed

Rule: Modify HF

Scenario: open the modification page
Given the user is connected to openIMIS
And the user is on the HF search page
When the user select the HF
And load it / click on 'modify'
Then the HF page must be loaded


Scenario: selection of Item price list
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
When the user change the selection box for the 'item price list'
Then the user should be able to chose another 'Item price list'

Scenario: Selection or service price list
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
When the user change the selection box for the 'Service price list'
Then the user should be able to chose another 'Service price list'

Scenario: Catchement definition : Region
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
When the user select a 'region'
Then the 'district' under that 'region' should be updated in the 'district' column

Scenario: Catchement definition : District
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'create HF page' is open
And 'Regions' catchement is selected
When the user select a 'district'
Then the 'Municipalities' under that 'district' should be updated in the 'Municipalities' column

Scenario: Catchement definition : Municipalities
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
And 'Regions' catchement is selected
And 'Districts' catchement is selected
When the user select a 'Municipalities'
Then the 'Villages' under that 'Municipalities' should be updated in the 'Village' column 
And the 'precentage of catchement' per village is editable

Scenario: Catchement definition : villages
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
And 'Regions' catchement is selected
And 'Districts' catchement is selected
And 'Municipalities' catchement is selected
When the user enter a 'percentage of catchement' for a village
Then the data entered should be kept until the page is open even if the user enter 'percentage of catchement' for other region/district/municipalities


Scenario: Select other choice list for HF
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
When the user select an option  in the 'Legal form','Level','care type' fields
Then list of related to 'Legal form','Level','care type' must be display 
And the user should be able to choose one.

Scenario: enter other specific HF data
Given the user is connected to openIMIS
And the user is on the HF search page
And a the 'modifiy HF page' is open
When the user enter text in the 'Code','Name','Phone', 'Fax', 'email' fields
Then text 'Legal form','Level','care type' must be update 


Scenario: Saving an HF
Given the user is connected to openIMIS
And a the 'modifiy HF page' is open
And the mandatory fields are filled
When the user click on 'Save'
Then the HF must be saved



Rule: Delete HF

Scenario: deleting a HF
Given the user is connected to openIMIS
And the user is on the HF search page
When the user select the HF
And load it / click on 'Delete'
And the user confirm the deletion
Then the HF must be deleted