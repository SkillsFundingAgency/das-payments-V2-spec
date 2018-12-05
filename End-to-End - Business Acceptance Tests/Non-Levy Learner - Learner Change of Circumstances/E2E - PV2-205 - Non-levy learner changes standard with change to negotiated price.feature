#Scenario: Non-Levy learner,  changes standard with accompanying change to the negotiated price	
#
#Feature: Provider earnings and payments where learner changes apprenticeship standard and there is a change to the negotiated price at the end of a month, (remaining with the same employer and provider)
#
#    Background:
#	
#        Given The learner is programme only non-DAS
#        And the apprenticeship funding band maximum is 17000
#        And levy balance > agreed price for all months
# 
#		When an ILR file is submitted with the following data:
#            | ULN       | standard code | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#            | learner a | 51            | 03/08/2018 | 01/08/2019       | 31/10/2018      | withdrawn         | 12000                | 03/08/2018                          | 3000                   | 03/08/2018                            |
#            | learner a | 52            | 03/11/2018 | 01/08/2019       |                 | continuing        | 4500                 | 03/11/2018                          | 1125                   | 03/11/2018                            |
#       		
#		Then the provider earnings and payments break down as follows:
#		
#            | Type                       		| 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
#            | Provider Earned Total      		| 1000  | 1000  | 1000  | 500   | 500   |
#            | Provider Earned from SFA   		| 900   |  900  |  900  | 450   | 450   |
#            | Provider Earned from Employer 	| 100   |  100  |  100  | 50    | 50    |            
#			| Provider Paid by SFA       		| 0     |  900  |  900  | 900   | 500   |
#            | Payment due from Employer         | 0     |  100  |  100  | 100   | 50    | 
#			| Levy account debited       		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy employer budget   		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy co-funding budget 		| 0     |    0  |    0  | 0     | 0     |
#			| SFA non-Levy co-funding budget	| 900   |  900  |  900  | 450   | 450   | 

Feature: Change standard and price but not from start - PV2-205
	As a provider,
	I want a non-levy learner, changes standard with change to negotiated price, to be paid the correct amount
	So that I am accurately paid my apprenticeship provision.

Scenario Outline: Non-Levy learner changes standard with accompanying change to the negotiated price PV2-205	
	Given the following learners
        | Learner Reference Number | Uln      |
        | na                       | 10001000 |
	And the following aims
		| Reference | Start Date                   | Planned Duration | Actual Duration | Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status |
		| ZPROG001  | 03/Aug/Current Academic Year | 12 months        | 3 months        | 1               | 25             | 51            | 16-18 Apprenticeship Non-Levy | withdrawn         |
		| ZPROG001  | 03/Nov/Current Academic Year | 9 months         |                 | 2               | 25             | 52            | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows		
        | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   | 90%                         |
        | 4500                 | 03/Nov/Current Academic Year        | 1125                   | 03/Nov/Current Academic Year          | Act2          | 2                   | 90%                         |

    When the ILR file is submitted for the learners for collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 500          | 0          | 0         |
        | Dec/Current Academic Year | 500          | 0          | 0         |
        | Jan/Current Academic Year | 500          | 0          | 0         |
        | Feb/Current Academic Year | 500          | 0          | 0         |
        | Mar/Current Academic Year | 500          | 0          | 0         |
        | Apr/Current Academic Year | 500          | 0          | 0         |
        | May/Current Academic Year | 500          | 0          | 0         |
        | Jun/Current Academic Year | 500          | 0          | 0         |
        | Jul/Current Academic Year | 500          | 0          | 0         |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
		| R04/Current Academic Year | Nov/Current Academic Year | 500          | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 500          | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 500          | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 500          | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 500          | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 500          | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 500          | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 500          | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 500          | 0          | 0         |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
		| R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
		| R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         |
	Examples:
		| Collection_Period         |
		| R01/Current Academic Year |
		| R02/Current Academic Year |
		| R03/Current Academic Year |
		| R04/Current Academic Year |
		| R05/Current Academic Year |
		| R06/Current Academic Year |
		| R07/Current Academic Year |
		| R08/Current Academic Year |
		| R09/Current Academic Year |
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |