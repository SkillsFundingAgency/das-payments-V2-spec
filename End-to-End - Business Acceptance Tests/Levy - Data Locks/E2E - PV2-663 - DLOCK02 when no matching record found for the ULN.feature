﻿#Scenario: DLOCK02 - When no matching record found in an employer digital account for the ULN then datalock DLOCK_02 will be produced
#
#    Given the following commitments exist:
#        | commitment Id | version Id | Provider   | ULN       | framework code | programme type | pathway code | agreed price | start date | end date   | status | effective from |
#        | 73            | 73-125     | Provider a | learner b | 450            | 2              | 1            | 10000        | 01/05/2018 | 01/05/2019 | active | 01/05/2018     |
#        
#    When an ILR file is submitted with the following data:  
#        | Provider   | ULN       | framework code | programme type | pathway code | start date | planned end date | completion status | Total training price | Total training price effective date |
#        | Provider a | learner a | 450            | 2              | 1            | 01/05/2018 | 08/08/2019       | continuing        | 10000                | 01/05/2018                          |
#    
#    Then no data lock event is returned

Feature: Data Lock - DLOCK02 - no matching ULN
		As a provider,
		I want to be notified with a DLOCK02 When no matching record found in an employer digital account for the ULN
		So that I can correct the data mis-match between the Commitment and ILR

Scenario: DLOCK02 - When no matching record found in an employer digital account for the ULN then datalock DLOCK_02 will be produced PV2-663
	Given Given the employer levy account balance in collection period "R10/Current Academic Year" is 10000
	And the following commitments exist
		| Learner ID | framework code | programme type | pathway code | agreed price | start date                   | end date                  | status | effective from               |
		| learner b  | 593            | 20             | 1            | 10000        | 01/May/Current Academic Year | 01/May/Next Academic Year | active | 01/May/Current Academic Year |
	And the provider is providing training for the following learners
		| Learner ID | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| learner a  | 01/May/Current Academic Year | 12 months        | 10000                | 01/May/Current Academic Year        | 0                      | 01/May/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	When the ILR file is submitted for the learners for collection period "R10/Current Academic Year"
	Then the no learner earnings should be generated
	# New step
    And no data lock event is returned
    And at month end no payments will be calculated
	And no provider payments will be generated
	And no provider payments will be recorded