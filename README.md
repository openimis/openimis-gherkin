[uri_license]:http://creativecommons.org/licenses/by-sa/4.0/
[uri_license_image]:https://i.creativecommons.org/l/by-sa/4.0/88x31.png

# Gherkin test case

Wiki page:
https://openimis.atlassian.net/wiki/spaces/OP/pages/879886341/Test+cases

## Gherkin structure

### Feature

Group of use case that have a common business goal, for example submit a claim
Example

```gherkin
Feature: Enter a claim
```

### Background

Prerequisites to resolve before starting the tests, a feature can have only on background
Example

```gherkin
Background:
Given HF with claim administrator is defined
Given the "Health facility claims page" is open
Given the Health facility and claim administrator are selected
Given the "Add" button was clicked
```

### Rules

Actual behavior that will be tested, a feature can have multiple rules
Example

```gherkin
Rule: error message if mandatory information are missing
```

### Scenario

on of the approach to validate the rules, several scenario can be required to validate a rule
Example

```gherkin
Scenario: validation of the mandatory field
Given that no fields were filled
When the "save" button is clicked
Then a message should appear to saying that the mandatory fields should be filled
And the mandatory fields should be highlighted in RED (Insurance Number, Claim No, Date claimed, Visit Date From, Visit Type, Main Diag)
```

## Gherkin key words

in addition to the structure name, Gherkin has other key words

### Given

Set a prerequisite for a specific scenario or background, if present must be the first keyword. to add multiple prerequisite the "And" key word must be used
Example

```gherkin
Given "Visit Date From","Visit Date To" are set
And the focus leaves the cell
```

### When

Define what will trigger the test
Example

```gherkin
When a date is entered in "Claimed Date"
```

### Then

Define the test result
Example

```gherkin
Then the system must check that the "Claimed Date" before or equal to today
And "Visit Date To" is before "Claimed Date"
And "Claimed Date" is after or equal "Visit Date From"
```

### And

helps to see when there is multiple conditions in a Given, When or Then