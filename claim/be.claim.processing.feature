Feature: claim processing

Background:
Given @HF1 is a valid health facility
And @CA is a valid claim administrator 
And that a claim @CM6 is created for a valid health facility @HF
And the @CM6 beneficiary @BE3 provided is an adult woman belonging to the group/familly @FM2 covered by the policy @PL1
And the @CM6 dates (visit from/to and claimed) and the main diagnoses are valid
And the @CM6 type is "in-patient"
And that a claim @CM7 is created for a valid health facility @HF
And the @CM7 beneficiary @BE4 provided is an children belonging to the group/familly @FM2 covered by the policy @PL1
And the @CM7 dates (visit from/to and claimed) and the main diagnoses are valid
And the @CM7 type is "out-patient"

Rule: 1. The beneficiary must be covered by a policy 

Scenario: 1.1 beneficiary not found
Given a claim @CM1 is created for a valid health facility @HF
And the beneficiary @BE1 provided doesn't exist
And the dates are correctes
When the claim @CM1 is submitted by @CA
Then the claim @CM1 is rejected with the "error code 7"

Scenario: 1.2 Familly/Group not found
Given a claim @CM2 is created for a valid health facility @HF
And the beneficiary @BE2 provided exist but doesn't belong to a valid group/familly (ie. no head ?)
And the dates are correctes
When the claim @CM2 is submitted by @CA
Then the claim @CM2 is rejected with the "error code 7"

Scenario: 1.3 no active policy on the familly/group
Given a claim @CM3 is created for a valid health facility @HF
And the beneficiary @BE3 provided belong group/familly @FM1 not covered by a policy
And the dates are correctes
When the claim @CM3 is submitted by @CA
Then the claim @CM3 is rejected with the "error code 7"


Rule: 2. the claim target dates must be valid (error code 9)

Scenario: 2.1 Care "From" date empty
Given a claim @CM4 is created for a valid health facility @HF
And the claim @CM4 is for the beneficiary @BE3 
And the "visit date from" is empty or unvalid
When the claim @CM4 is submitted by @CA
Then the claim @CM4 is rejected with the "error code 9"

Scenario: 2.2 Care "To" date before "From" date
Given a claim @CM5 is created for a valid health facility @HF
And the claim @CM5 is for the beneficiary @BE3 
And the "visit date from" is empty
And the "visit date To" is empty or unvalid
When the claim @CM5 is submitted by @CA
Then the claim @CM5 is rejected with the "error code 9"


Rule: 3. The beneficiary must be elegibile (mask compatible) for the claim items/Servies

Scenario: 3.1 The Item doesn't have a mask compatible with the beneficiary mask
Given the Beneficiary has a mask @MS1
When the Item @IT1 is added to the claim @CM6
And the service @IT1 mask @MS2 is not compatible with @MS1
When the claim @CM6 is submitted by @CA
Then the Service @IT1 of the claim @CM6 is rejected with the "error code 4"

Scenario: 3.2 The Service doesn't have a mask compatible with the beneficiary mask
Given the Beneficiary has a mask @MS1
When the service @SC1 is added to the claim @CM6
And the service @SC1 mask @MS2 is not compatible with @MS1
When the claim @CM6 is submitted by @CA
Then the Service @SC1 of the claim @CM6 is rejected with the "error code 4"


Rule: 4. the beneficiary already benefit from the service/item within the waiting period 

Scenario: 4.1 The service was already provided within the service waiting period
Given that the service @SC2 has a waiting period set
When this service @SC2 is added to a new claim  @CM6
And the claim @CM6 is submitted by @CA
Then the service @SC2 must be rejected (and the claim if no other valid service/Item) with the "reason code 17"

Scenario: 4.2 The Item was already provided within the item waiting period
Given that the Item @IT2 has a waiting period set
And the beneficiary @BE3 had the Item @IT2 already covered by his active policy @PL1 within the waiting period
When this Item @IT2 is added to a new claim  @CM6
And the claim @CM6 is submitted by @CA
Then the Item @IT2 must be rejected (and the claim if no other valid service/Item) with the "reason code 17"


Rule: 5. the beneficiary already benefit the maximun of time of the service/item

Scenario: 5.1 The service was already provided the maximum number of time for an adult
Given that the service @SC3 has a ceiling set for adults
And its service @SC3 cieling is already reached for the beneficiary @BE3 for his active policy @PL1
When this service is added to a new claim  @CM6 
And the claim is submitted by @CA
Then the service @SC3 must be rejected (and the claim if no other valid service/Item) with the "reason code 16"

Scenario: 5.2 The Item was already provided within the maximum number of time time for an children
Given that the item @IT3 has a ceiling set for childrens
And the item @IT3 cieling is already reached for the beneficiary @BE3 for his active policy @PL1
When this item @IT3 is added to a new claim  @CM7 
And the claim is submitted by @CA
Then the item @IT3 must be rejected (and the claim if no other valid service/Item) with the "reason code 16"


Rule: 6. Maximum consultation limits

Scenario: 6.1 insuree having already used all her consultations
Given the service @SC4 is a "C" type service
And the consultation limitsis already reached for the beneficiary @BE3 for his active policy @PL1
When the service @SC4 is added to the claim @CM6
And the claim @CM6 is submitted
Then the service @SC4 must be rejected with the  "reason code 13"


Rule: 7. Maximum surgeries limits

Scenario: 7.1 insuree having already used all her surgeries
Given the service @SC5 is a "S" type service
And the surgeries limits is already reached for the beneficiary @BE3 for his active policy @PL1
When the service @SC5 is added to the claim @CM6
And the claim @CM6 is submitted
Then the service @SC5 must be rejected with the  "reason code 14"


Rule: 8. Maximum deliveries limits

Scenario: 8.1 insuree having already used all her delivery
Given the service @SC6 is a "D" type service
And the deliveries limits is already reached for the beneficiary @BE3 for his active policy @PL1
When the service @SC6 is added to the claim @CM6
And the claim @CM6 is submitted
Then the service @SC6 must be rejected with the  "reason code 15"


Rule: 9. Maximum Hospital visit limits

Scenario: 9.1 insuree having already used all her hospital visit
Given the service @SC7 is a "H" type service
And the Hospital visit limits is already reached for the beneficiary @BE3 for his active policy @PL1
When the service @SC7 is added to the claim @CM6
And the claim @CM6 is submitted
Then the service @SC7 must be rejected with the "reason code 11"


Rule: 10. Maximum Hospital visit limits

Scenario: 10.1 insuree having already used all her hospital visit
Given the service @SC8 is a "V" type service
And the Hospital visit limits is already reached for the beneficiary @BE3 for his active policy @PL1
When the service @SC8 is added to the claim @CM6
And the claim @CM6 is submitted
Then the service @SC8 must be rejected with the "reason code 12"


Rule: 11. Item/service not found

Scenario: 11.1 Service not found 
Given that the service @SC9 has doesn't exist
When this service @SC9 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the service @SC2 must be rejected (and the claim if no other valid service/Item) with the "reason code 3"

Scenario: 11.2 Item not found 
Given that the Item @IT4 has doesn't exist
When this Item @IT4 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the Item @IT4 must be rejected (and the claim if no other valid service/Item) with the "reason code 3"


Rule: 12 the Item and Services must be valid 

Scenario: Invalid Item (not covered by policy I guess)
Given that the Item @IT5 exist
And the Item @IT5 is not covered by @PL1
When the Item @IT5 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the Item @IT5 must be rejected (and the claim if no other valid service/Item) with the "reason code 1"

Scenario: Invalid service (not covered by policy I guess)
Given that the service @SC10 exist
And the service @SC10 is not covered by @PL1
When the service @SC10 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the service @SC10 must be rejected (and the claim if no other valid service/Item) with the "reason code 1"


Rule: 13 the Item and Services must be part of a valid price list

Scenario: Item not part of a valid price list
Given that the Item @IT6 exist
And the Item @IT6 is not in a price list valid for @HF and @PL1
When the Item @IT6 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the Item @IT6 must be rejected (and the claim if no other valid service/Item) with the "reason code 2"

Scenario: Service not part of a valid price list
Given that the service @SC11 exist
And the service @SC11 is not in a price list valid for @HF and @PL1
When the service @SC11 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the service @SC11 must be rejected (and the claim if no other valid service/Item) with the "reason code 2"

Rule: 14 the service/Item must be compatible with the care type (ec10)

Scenario: Item not for the right care type (in/out patient)
Given that Item @IT7 is for an 'in-patient'
When the Item @IT7 is added to a new claim @CM7
And the claim @CM7 is submitted by @CA
Then the Item @IT7 must be rejected (and the claim if no other valid service/Item) with the "reason code 10"

Scenario: Service not for the right care type (in/out patient)
Given that the service @SC12 is for an 'out-patient'
When the service @SC12 is added to a new claim @CM6
And the claim @CM6 is submitted by @CA
Then the service @SC12 must be rejected (and the claim if no other valid service/Item) with the "reason code 10"

