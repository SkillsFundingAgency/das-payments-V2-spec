#Scenario: Non-Levy learner, increases TNP4 in isolation (no change to TNP3)
#
#Earnings and payments for a non-Levy, and the residual assessment cost is increased in isolation (no change to residual training price) during the programme
#
#
#		Given The learner is programme only non-Levy        
#		And the apprenticeship funding band maximum is 27000
#	
#		When an ILR file is submitted on 03/12/2018 with the following data:
#		
#            | ULN       | start date | planned end date | actual end date | completion status | standard code | Residual training price 1 | Residual training price 1 effective date | Residual assessment price 1 | Residual assessment price 1 effective date | Residual assessment price 2 | Residual assessment price 2 effective date |
#            | learner a | 05/08/2018 | 28/08/2019       |                 | continuing        | 11            | 12000                     | 05/08/2018                               | 3500                        | 05/08/2018                                 | 4000                        | 15/11/2018                                 |
#  		
# 		Then the provider earnings and payments break down as follows:
#		
#            | Type                          | 08/18   | 09/18   | 10/18   | 11/18   | 12/18   | 01/19   |
#            | Provider Earned Total         | 1033.33 | 1033.33 | 1033.33 | 1422.22 | 1422.22 | 1422.22 |
#            | Provider Earned from SFA      | 929.99  | 929.99  | 929.99  | 1279.99 | 1279.99 | 1279.99 |
#            | Provider Earned from Employer | 103.33  | 103.33  | 103.33  | 142.22  | 142.99  | 142.99  |
#            | Provider Paid by SFA          | 0       | 929.99  | 929.99  | 929.99  | 1279.99 | 1279.99 |
#            | Payment due from Employer     | 0       | 103.33  | 103.33  | 103.33  | 142.99  | 142.99  |  
#            | Levy account debited          | 0       | 0       | 0       | 0       | 0       | 0       |
#            | SFA Levy employer budget      | 0       | 0       | 0       | 0       | 0       | 0       |
#            | SFA Levy co-funding budget    | 0       | 0       | 0       | 0       | 0       | 0       |			
#			|SFA non-Levy co-funding budget	| 929.99  | 929.99  | 929.99  | 1279.99 | 1279.99 |1279.99  |

#Notes: Residual Training Price columns

Scenario Outline:	Non-levy learner increases TNP4 in isolation (no change to TNP3) PV2-303	
					Earnings and payments for a non-Levy, and the residual assessment cost is increased in isolation (no change to residual training price) during the programme
	Given the provider previously submitted the following learner details
        | Start Date                   | Planned Duration | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
        | 05/Aug/Current Academic Year | 12 months        | 12000                   | 05/Aug/Current Academic Year           | 3500                      | 05/Aug/Current Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 25             | 11            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
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
        | Start Date                   | Planned Duration | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
        | 05/Aug/Current Academic Year | 12 months        | 12000                   | 05/Aug/Current Academic Year           | 4000                      | 15/Nov/Current Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 25             | 11            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1033.33333   | 0          | 0         |
        | Sep/Current Academic Year | 1033.33333   | 0          | 0         |
        | Oct/Current Academic Year | 1033.33333   | 0          | 0         |
        | Nov/Current Academic Year | 1422.22222   | 0          | 0         |
        | Dec/Current Academic Year | 1422.22222   | 0          | 0         |
        | Jan/Current Academic Year | 1422.22222   | 0          | 0         |
        | Feb/Current Academic Year | 1422.22222   | 0          | 0         |
        | Mar/Current Academic Year | 1422.22222   | 0          | 0         |
        | Apr/Current Academic Year | 1422.22222   | 0          | 0         |
        | May/Current Academic Year | 1422.22222   | 0          | 0         |
        | Jun/Current Academic Year | 1422.22222   | 0          | 0         |
        | Jul/Current Academic Year | 1422.22222   | 0          | 0         |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R04/Current Academic Year | Nov/Current Academic Year | 1422.22222   | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 1422.22222   | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 1422.22222   | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 1422.22222   | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1422.22222   | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 1422.22222   | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 1422.22222   | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1422.22222   | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1422.22222   | 0          | 0         |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1280                   | 142.22222                   | Learning         |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R04/Current Academic Year | Nov/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1280                   | 142.22222                   | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1280                   | 142.22222                   | Learning         |
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