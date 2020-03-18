Feature: Location CRUD

Rule: Create HF

Scenario: create Region
Given the user is connected
And the user has all right on all Locations
And the user is on the location page
When user select a region
And click on 'add'
Then the user should be able to enter 'code' and 'Name' fields
And the user should be able to save his changes

Scenario: create District
Given the user is connected
And the user has all right on all Locations
And the user is on the location page
When user select a district
And click on 'add' 
Then the user should be able to enter 'code' and 'Name' fields
And the user should be able to save his changes


Scenario: create Municipalities
Given the user is connected
And the user has all right on all Locations
And the user is on the location page
When select the Municipalities
And click on 'add' 
Then the user should be able to enter 'code' and 'Name' fields
And the user should be able to save his changes

Scenario: create Village
Given the user is connected 
And the user has all right on all Locations
And the user is on the location page
When select the village
And click on 'add' 
Then the location modification frame must be loaded
And the user should be able to edit 'code', 'Name' fields
And the user should be able to update the population number for the fields 'men', 'women', 'families', 'other'
And the user should be able to save his changes

Scenario: Saving an Location
Given the user is connected to openIMIS
And a the 'modifiy Location page' is open
And the mandatory fields are filled
When the user click on 'Save'
Then the Location must be saved
Rule: Modify Location

Scenario: modify Region
Given the user is connected 
And the user has all right on all Locations
And the user is on the location page
When the user select a region 
And click on 'Modify' (double click)
Then the location modification frame must be loaded
And the user should be able to edit 'code' and 'Name' fields
And the user should be able to save his changes

Scenario: modify District
Given the user is connected 
And the user has all right on all Locations
And the user is on the location page
When the user select a District 
And click on 'Modify' (double click)
Then the location modification frame must be loaded
And the user should be able to edit 'code' and 'Name' fields
And the user should be able to save his changes

Scenario: modify Municipalities
Given the user is connected 
And the user has all right on all Locations
And the user is on the location page
When the user select a Municipalities 
And click on 'Modify' (double click)
Then the location modification frame must be loaded
And the user should be able to edit 'code' and 'Name' fields
And the user should be able to save his changes

Scenario: modify Village
Given the user is connected 
And the user has all right on all Locations
And the user is on the location page
When the user select a Village 
And click on 'Modify' (double click)
Then the location modification frame must be loaded
And the user should be able to edit 'code', 'Name' fields
And the user should be able to update the population number for the fields 'men', 'women', 'families', 'other'
And the user should be able to save his changes

Scenario: Saving an Location
Given the user is connected to openIMIS
And a the 'modifiy Location page' is open
And the mandatory fields are filled
When the user click on 'Save'
Then the Location must be saved

Rule: move Location

Scenario: moving a Location
Given the user is connected to openIMIS
And the user is on the Location page
When the user select the Location
And load it / click on 'move'
Then the useer must be able to select the new parent
And save his choice


Rule: Delete Location

Scenario: deleting a Village
Given the user is connected to openIMIS
And the user is on the Location page
When the user select a Village
And load it / click on 'Delete'
And the user confirm the deletion
Then the Village must be deleted (kept as historical value)

Scenario: deleting a Municipality and underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
When the user select a Municipality
And load it / click on 'Delete'
And the user confirm the deletion
Then the Municipality and the underlying Location(s) must be deleted (kept as historical value)

Scenario: deleting a Municipality and move underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
And the is another municipality in the same disctrict
And there is underlying Location(s) 
When the user select a Municipality
And load it / click on 'Delete'
And the user select the munipality to move the village
Then the Location must be deleted (kept as historical value)
And the underlying Location(s) move to the selected Municipality

Scenario: deleting a District and underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
When the user select a District
And load it / click on 'Delete'
And the user confirm the deletion
Then the district and the underlying Location(s) must be deleted (kept as historical value)

Scenario: deleting a District and move  underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
And the is another District in the same region
And there is underlying Location(s) 
When the user select a District
And load it / click on 'Delete'
And the user select the District to move the village
Then the Location must be deleted (kept as historical value)
And the underlying Location(s) move to the selected District

Scenario: deleting a Region and underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
When the user select a Region
And load it / click on 'Delete'
And the user confirm the deletion
Then the Region and underlying Location must be deleted (kept as historical value)


Scenario: deleting a Region and move underlying Location 
Given the user is connected to openIMIS
And the user is on the Location page
And the is another region
And there is underlying Location(s) 
When the user select a Region
And load it / click on 'Delete'
And the user select the Region to move the village
Then the Region must be deleted (kept as historical value)
And the underlying Location(s) move to the selected Region