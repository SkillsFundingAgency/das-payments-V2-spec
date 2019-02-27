#Scenario: DLOCK03 - When no matching record found in an employer digital account for for the standard code then datalock DLOCK_03 will be produced
#   
#   Given the following commitments exist:
#   
#        | commitment Id | version Id | Provider   | ULN       | standard code | agreed price | start date | end date   | status | effective from |
#        | 73            | 73-125     | Provider a | learner a | 21            | 10000        | 01/05/2018 | 01/05/2019 | active | 01/05/2018     |
#        
#    When an ILR file is submitted with the following data:  
#	
#        | Provider   | ULN       | standard code | start date | planned end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | Provider a | learner a | 23            | 01/05/2018 | 08/08/2019       | continuing        | 9000                 | 01/05/2018                          | 1000                   | 01/05/2018                            |
#    
#    Then the following data lock event is returned:
#	
#        | Price Episode identifier  | Apprenticeship Id | ULN       | ILR Start Date | ILR Training Price | ILR End point assessment price  | 
#        | 25-23-01/05/2018          | 73                | learner a | 01/05/2018     | 9000               | 1000                            |
#    
#	And the data lock event has the following errors:   
#	
#        | Price Episode identifier  | Error code | Error Description										                      |
#        | 25-23-01/05/2018          | DLOCK_03   | No matching record found in the employer digital account for the standard code |
#    
#	And the data lock event has the following periods: 
#	
#        | Price Episode identifier | Period   | Payable Flag | Transaction Type |
#        | 25-23-01/05/2018         | 1718-R10 | false        | Learning         |
#        | 25-23-01/05/2018         | 1718-R11 | false        | Learning         |
#        | 25-23-01/05/2018         | 1718-R12 | false        | Learning         |
#    
#	And the data lock event used the following commitments:
#	
#        | Price Episode identifier | Apprentice Version | Start Date | standard code | Negotiated Price | Effective Date |
#        | 25-23-01/05/2018         | 73-125             | 01/05/2018 | 21            | 10000            | 01/05/2018     |

Feature: Data Lock - DLOCK03 - no matching standard code
		As a Provider,
		I want to be notified with a DLOCK03 when no matching record found in an employer digital account for the Standard Code
		So that I can correct the data mis-match between the Commitment and ILR

Scenario: DLOCK03 - When no matching record found in an employer digital account for for the standard code then datalock DLOCK_03 will be produced PV2-664
	Given Given the employer levy account balance in collection period "R10/Current Academic Year" is 10000
	And the following commitments exist
	# Learner ID kept for data lock event
		| commitment Id | version Id | Learner ID | standard code | agreed price | start date                   | end date                  | status | effective from               |
		| 73            | 73-125     | learner a  | 21            | 10000        | 01/May/Current Academic Year | 01/May/Next Academic Year | active | 01/May/Current Academic Year |
	And the provider is providing training for the following learners
		| Learner ID | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| learner a  | 01/May/Current Academic Year | 12 months        | 9000                 | 01/May/Current Academic Year        | 1000                   | 01/May/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 23            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	When the ILR file is submitted for the learners for collection period "R10/Current Academic Year"
	Then the no learner earnings should be generated
	# New step
    And the following data lock event is returned
        | Price Episode identifier | Apprenticeship Id | Learner ID | ILR Start Date               | ILR Training Price | ILR End point assessment price  |
        | 25-23-01/05/2018         | 73                | learner a  | 01/May/Current Academic Year | 9000               | 1000                            |
	# New step
	And the data lock event has the following errors   
        | Price Episode identifier | Error code | Error Description                                                              |
        | 25-23-01/05/2018         | DLOCK_03   | No matching record found in the employer digital account for the standard code |
	# New step
	And the data lock event has the following periods    
        | Price Episode identifier | Period                    | Payable Flag | Transaction Type |
        | 25-23-01/05/2018         | Current Academic Year-R10 | false        | Learning         |
        | 25-23-01/05/2018         | Current Academic Year-R11 | false        | Learning         |
        | 25-23-01/05/2018         | Current Academic Year-R12 | false        | Learning         |
	# New step
	And the data lock event used the following commitments 	
        | Price Episode identifier | Apprentice Version | Start Date                   | standard code | Negotiated Price | Effective Date               |
        | 25-23-01/05/2018         | 73-125             | 01/May/Current Academic Year | 21            | 10000            | 01/May/Current Academic Year |
    And at month end no payments will be calculated
	And no provider payments will be generated
	And no provider payments will be recorded