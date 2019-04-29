#Feature: 5% Contribution from April 2019
#
#Scenario: Non Levy Learner, started learning before Apr19, changes Provider from Apr19 stays on the same course, remains on 10% contribution
#
#Background: The example is demonstrating a learner flagged as 'Non Levy' ACT2 starts learning pre April 2019 changes Provider after Apr19
#			and remains at 10% contribution as the learning is not new learning from Apr19, and the learner is existing learner
#	
#    Given The learner is programme only Non Levy 
#	And the apprenticeship funding band maximum is 15000
#
#    When the providers submit the following ILR files:
#        | Provider   | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | provider a | learner a | 06/08/2018 | 08/08/2019       | 31/03/2019      | withdrawn         | 12000                | 06/08/2018                          | 3000                   | 06/08/2018                            |
#        | provider b | learner a | 01/04/2019 | 08/08/2019       |                 | continuing        | 4000                 | 01/04/2019                          | 1000                   | 01/04/2019                            |
#         
#    Then OBSOLETE - the earnings and payments break down for provider a is as follows:
#        | Type                           | 08/18 | 09/18 | 10/18 | ... | 03/19 | 04/19 | ... | 08/19 |
#        | Provider Earned Total          | 1000  | 1000  | 1000  | ... | 1000  | 0     | ... | 0     |
#        | Provider Earned from SFA       | 900   | 900   | 900   | ... | 900   | 0     | ... | 0     |
#        | Provider Earned from Employer  | 100   | 100   | 100   | ... | 100   | 0     | ... | 0     |
#        | Provider Paid by SFA           | 0     | 900   | 900   | ... | 900   | 900   | ... | 0     |
#        | Payment due from Employer      | 0     | 100   | 100   | ... | 100   | 100   | ... | 0     |
#        | Levy account debited           | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     |
#        | SFA Levy employer budget       | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     |
#        | SFA Levy co-funding budget     | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     |
#        | SFA non-Levy co-funding budget | 900   | 900   | 900   | ... | 900   | 0     | ... | 0     |
#        
#    And OBSOLETE - the earnings and payments break down for provider b is as follows:
#        | Type                           | 08/18 | ... | 04/19 | 05/19 | 06/19 | 07/19 | 08/19 |
#        | Provider Earned Total          | 0     | ... | 1000  | 1000  | 1000  | 1000  | 0     |
#        | Provider Earned from SFA       | 0     | ... | 900   | 900   | 900   | 900   | 0     |
#        | Provider Earned from Employer  | 0     | ... | 100   | 100   | 100   | 100   | 0     |
#        | Provider Paid by SFA           | 0     | ... | 0     | 900   | 900   | 900   | 900   |
#        | Payment due from Employer      | 0     | ... | 0     | 100   | 100   | 100   | 100   |
#        | Levy account debited           | 0     | ... | 0     | 0     | 0     | 0     | 0     |
#        | SFA Levy employer budget       | 0     | ... | 0     | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget     | 0     | ... | 0     | 0     | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget | 0     | ... | 900   | 900   | 900   | 900   | 0     |

Feature: 5% Contribution from April 2019 PV2-897

Scenario Outline: Non Levy Learner, started learning before Apr19, changes Provider from Apr19 stays on the same course, remains on 10% contribution

Given "provider a" previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 12000                | 06/Aug/Current Academic Year        | 3000                  | 06/Aug/Current Academic Year         | 8 months        | withdrawan        | Act2          | 1                   | ZPROG001      | 17            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the following earnings had been generated for the learner
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 1000         | 0          | 0         |
		| Sep/Current Academic Year | 1000         | 0          | 0         |
		| Oct/Current Academic Year | 1000         | 0          | 0         |
		| Nov/Current Academic Year | 1000         | 0          | 0         |
		| Dec/Current Academic Year | 1000         | 0          | 0         |
		| Jan/Current Academic Year | 1000         | 0          | 0         |
		| Feb/Current Academic Year | 1000         | 0          | 0         |
		| Mar/Current Academic Year | 1000         | 0          | 0         |
		| Apr/Current Academic Year | 0            | 0          | 0         |
		| May/Current Academic Year | 0            | 0          | 0         |
		| Jun/Current Academic Year | 0            | 0          | 0         |
		| Jul/Current Academic Year | 0            | 0          | 0         |
	And the following payments had been generated for "provider a"
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                          | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                          | Learning         |
		| R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                          | Learning         |
		| R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                          | Learning         |
	But the Learner has now changed to "provider b" as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 05/Apr/Current Academic Year | 4 months         | 3200                 | 05/Apr/Current Academic Year        | 800                     | 05/Apr/Current Academic Year         |                 | continuing        | Act2          | 1                   | ZPROG001      | 15            | 25            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 0            | 0          | 0         |
		| Sep/Current Academic Year | 0            | 0          | 0         |
		| Oct/Current Academic Year | 0            | 0          | 0         |
		| Nov/Current Academic Year | 0            | 0          | 0         |
		| Dec/Current Academic Year | 0            | 0          | 0         |
		| Jan/Current Academic Year | 0            | 0          | 0         |
		| Feb/Current Academic Year | 0            | 0          | 0         |
		| Mar/Current Academic Year | 0            | 0          | 0         |
		| Apr/Current Academic Year | 800          | 0          | 0         |
		| May/Current Academic Year | 800          | 0          | 0         |
		| Jun/Current Academic Year | 800          | 0          | 0         |
		| Jul/Current Academic Year | 800          | 0          | 0         |
	And only the following payments will be calculated
		| Provider   | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| provider b | R09/Current Academic Year | Apr/Current Academic Year | 800          | 0          | 0         |
		| provider b | R10/Current Academic Year | May/Current Academic Year | 800          | 0          | 0         |
		| provider b | R11/Current Academic Year | Jun/Current Academic Year | 800          | 0          | 0         |
		| provider b | R12/Current Academic Year | Jul/Current Academic Year | 800          | 0          | 0         |
	And only the following provider payments will be recorded
		| Provider   | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| provider b | R09/Current Academic Year | Apr/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R10/Current Academic Year | May/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R11/Current Academic Year | Jun/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R12/Current Academic Year | Jul/Current Academic Year | 720                    | 80                          | Learning         |
	And at month end only the following provider payments will be generated
		| Provider   | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| provider b | R09/Current Academic Year | Apr/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R10/Current Academic Year | May/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R11/Current Academic Year | Jun/Current Academic Year | 720                    | 80                          | Learning         |
		| provider b | R12/Current Academic Year | Jul/Current Academic Year | 720                    | 80                          | Learning         |
		
	Examples:
		| Collection_Period         |
		| R09/Current Academic Year |
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |