Feature: Connect via USSD

  The USSD solution allows on-line accomplishing of several IMIS functions in an environment with presence of a mobile network but not necessarily Internet connectivity.
  
  Scenario: Successful user connection to the API
	Given that the user is known by IMIS, USSD_phone_number 
	Given USSD_phone_number
    And USSD_language are configured in the phone
	When The user send the correct user_name (USSD_user)
    And the password (USSD_Password) to the USSD platform
	Then The user is connected (the USSD platform send a valid token)

  Scenario: Unsuccessful user connection to the API
	Given that the user is known by IMIS, USSD_phone_number 
	Given USSD_language are configured in the phone
	When The user send the incorrect user_name (USSD_user)
    And the password (USSD_Password) to the USSD platform
	Then The user receive a error SMS (400 - Invalid credentials) to the USSD_phone_number
  
  Scenario: Not authorized user connection to the API
	Given that the user is known by IMIS, USSD_phone_number 
	Given USSD_language are configured in the phone
	When The user send the correct user_name (USSD_user)
    And the password (USSD_Password) to the USSD platform
	Then The user receive a error SMS (401 - No authorization) to the USSD_phone_number 

Feature: Receive coverage information via USSD

  Information about coverage of an insuree is sent in a SMS to a mobile phone of an enrolment officer (to mobile phone of a user initiating the enquiry).
  
  Scenario: Successful get coverage
    Given The user is connected (has valid token)
	And The following input data are provided by the USSD solution: USSD_language 
	And USSD_user_name (EO_code ?)
	And USSD_password
	And USSD_phone_number
	When the user send his Insurance_number_of_insuree (USSD_ CHFID) to the USSD platform
    Then The user receive a informatory SMS message to the USSD_phone_number, the SMS contain user info (last_names,other_names,birth_date)
    And information per coverage_product (product_code,status_policy,effective_date,expiry_date)

  Scenario: unsuccessful get coverage
    Given The user is connected (has valid token)
	When the user send his Insurance_number_of_insuree (USSD_ CHFID) to the USSD platform
    Then The user receive an error message containing the error_message matching the error that occurred
 
Feature: Renew policy via USSD

   information about a successful renewal is sent in a SMS to a mobile phone of an enrolment officer (to mobile phone of a user initiating the renewal).
 
   Scenario: Successful renew
    Given The user is connected (has valid token)
	Given The following input data are provided by the USSD solution: USSD_language 
	And USSD_user_name (EO_code ?)
	And USSD_password
	And USSD_phone_number ?
	And USSD_CHFID
	And USSD_product_code
	And USSD_receipt_number
	And USSD_amount
	When the user send insurance_number(USSD_CHFID)
    And product_code(USSD_ product_code)
    And renewal_date(current date)
    And enrolment_officer_code(USSD_user_name)to the USSD platform
    Then The user receive an error message containing the receipt_no(USSD_receipt_number)
    And payment_type(“mobile phone”)
    And reaction_type(“not activate”)
    And insurance_number(USSD_CHFID)
    And product_code( USSD_product_code)
    And contribution_amount(USSD_amount)
    And payer(empty) 

   Scenario: unsuccessful renew
    Given The user is connected (has valid token)
	When the user send insurance_number(USSD_CHFID)
    And product_code(USSD_ product_code)
    And renewal_date(current date)
    And enrolment_officer_code(USSD_user_name)to the USSD platform
    Then The user receive an error message containing the error_message matching the error that occurred

	
Feature: request control number via USSD

  A control number is assigned to an intended payment
    And information about the assigned control number is sent in a SMS to a mobile phone of a user initiating the request.
  
   Scenario: Successful renew
    Given The user is connected (has valid token)
	Given The following input data are provided by the USSD solution:
	And USSD_language 
	And USSD_user_name (EO_code ?)
	And USSD_password
	And USSD_phone_number ?
	And USSD_CHFID
	And USSD_product_code
	And USSD_receipt_number
	And USSD_amount
	When the user send phone_number(USSD_phone_number)
    And request_date(current date enrolment_officer_code(USSD_EO_code)
    And language ( USSD_language)
    And insurance_number(USSD_CHFID)
    Then 
	
Feature: Check commission balance 


