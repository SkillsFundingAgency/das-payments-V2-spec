#Scenario: Non - Levy learner, decreases TNP2 in isolation (no change to TNP1)			
			
#
#Earnings and payments for a non-Levy learner, apprenticeship standard, and the total assessment cost (TNP2) is DECREASED in isolation (no change to total training price) during the programme
#
#        Given The learner is programme only DAS
#		
#		And the apprenticeship funding band maximum is 27000
#       
#		When an ILR file is submitted in 03/12/2018 with the following data:
#		
#			| ULN       | start date | planned end date | actual end date | completion status | standard code | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date | Total assessment price 2 | Total assessment price 2 effective date |
#			| learner a | 05/08/2018 | 28/08/2019       |                 | continuing        | 11            | 12000                  | 05/08/2018                            | 3500                     | 05/08/2018                              | 2000                     | 15/11/2018                              |
#		
#		Then the provider earnings and payments break down as follows:
#			| Type                          | 08/18   | 09/18   | 10/18   | 11/18   | 12/18  | 01/19  |
#			| Provider Earned Total         | 1033.33 | 1033.33 | 1033.33 | 900.00  | 900.00 | 900.00 |
#			| Provider Earned from SFA      | 929.99  | 929.99  | 929.99  | 810.00  | 810.00 | 810.00 |
#			| Provider Earned from Employer | 103.33  | 103.33  | 103.33  | 90      | 90     | 90     |
#			| Provider Paid by SFA          | 0       | 929.99  | 929.99  | 929.99  | 810    | 810    |
#			| Payment due from Employer     | 0       | 103.33  | 103.33  | 103.33  | 90     | 90     |
#			| Levy account debited          | 0       | 0       | 0       | 0       | 0      |  0     |
#			| SFA Levy employer budget      | 0       | 0       | 0       | 0       | 0      |  0     |
#			| SFA Levy co-funding budget    | 0       | 0       | 0       | 0       | 0      |  0     |			
#			|SFA non-Levy co-funding budget	| 929.99  | 929.99  | 929.99  | 810     | 810    | 810    |

Scenario Outline:	Non-levy learner decreases TNP2 in isolation (no change to TNP1) PV2-302	
					Earnings and payments for a non-Levy learner, apprenticeship standard, and the total assessment cost (TNP2) is DECREASED in isolation (no change to total training price) during the programme
    Given the provider previously submitted the following learner details
        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
        | 1        | 05/Aug/Current Academic Year | 12 months        | 12000                | 05/Aug/Current Academic Year        | 3500                   | 05/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 25             | 11            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1033.33333   | 0          | 0         |
        | Sep/Current Academic Year | 1033.33333   | 0          | 0         |
        | Oct/Current Academic Year | 1033.33333   | 0          | 0         |
        | Nov/Current Academic Year | 1033.33333   | 0          | 0         |
        | Dec/Current Academic Year | 1033.33333   | 0          | 0         |
        | Jan/Current Academic Year | 1033.33333   | 0          | 0         |
        | Feb/Current Academic Year | 1033.33333   | 0          | 0         |
        | Mar/Current Academic Year | 1033.33333   | 0          | 0         |
        | Apr/Current Academic Year | 1033.33333   | 0          | 0         |
        | May/Current Academic Year | 1033.33333   | 0          | 0         |
        | Jun/Current Academic Year | 1033.33333   | 0          | 0         |
        | Jul/Current Academic Year | 1033.33333   | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 930                    | 103.33333                   | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 930                    | 103.33333                   | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 930                    | 103.33333                   | Learning         |
	But the Provider now changes the Learner details as follows
        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
        | 1        | 05/Aug/Current Academic Year | 12 months        | 12000                | 05/Aug/Current Academic Year        | 2000                   | 15/Nov/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 25             | 11            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1033.33333   | 0          | 0         |
        | Sep/Current Academic Year | 1033.33333   | 0          | 0         |
        | Oct/Current Academic Year | 1033.33333   | 0          | 0         |
        | Nov/Current Academic Year | 900          | 0          | 0         |
        | Dec/Current Academic Year | 900          | 0          | 0         |
        | Jan/Current Academic Year | 900          | 0          | 0         |
        | Feb/Current Academic Year | 900          | 0          | 0         |
        | Mar/Current Academic Year | 900          | 0          | 0         |
        | Apr/Current Academic Year | 900          | 0          | 0         |
        | May/Current Academic Year | 900          | 0          | 0         |
        | Jun/Current Academic Year | 900          | 0          | 0         |
        | Jul/Current Academic Year | 900          | 0          | 0         |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R04/Current Academic Year | Nov/Current Academic Year | 900          | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 900          | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 900          | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 900          | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 900          | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 900          | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 900          | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 900          | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 900          | 0          | 0         |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 810                    | 90                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 810                    | 90                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 810                    | 90                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 810                    | 90                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 810                    | 90                          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 810                    | 90                          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 810                    | 90                          | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 810                    | 90                          | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 810                    | 90                          | Learning         |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 810                    | 90                          | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 810                    | 90                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 810                    | 90                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 810                    | 90                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 810                    | 90                          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 810                    | 90                          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 810                    | 90                          | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 810                    | 90                          | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 810                    | 90                          | Learning         |
Examples:
		| Collection_Period         |
		| R04/Current Academic Year |
		| R05/Current Academic Year |
		| R06/Current Academic Year |
		| R07/Current Academic Year |
		| R08/Current Academic Year |
		| R09/Current Academic Year |
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |