#Scenario: Non-levy learner changes provider but remains with the same employer, and there is a gap between the two learning spells
#        Given The learner is programme only non-levy
#		And the apprenticeship funding band maximum is 15000
#        
#        When the providers submit the following ILR files:
#            | Provider   | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#            | provider a | learner a | 06/08/2018 | 08/08/2019       | 04/03/2019      | withdrawn         | 6000                 | 06/08/2018                          | 1500                   | 06/08/2018                            |
#            | provider b | learner a | 06/06/2019 | 20/11/2019       |                 | continuing        | 3000                 | 06/06/2019                          | 1500                   | 06/06/2019                            |
#         
#        Then OBSOLETE - the earnings and payments break down for provider a is as follows:
#            | Type                           | 08/18 | 09/18 | 10/18 | ... | 02/19 | 03/19 | 04/19 | ... | 11/19 |
#            | Provider Earned Total          | 500   | 500   | 500   | ... | 500   | 0     | 0     | ... | 0     |
#            | Provider Earned from SFA       | 450   | 450   | 450   | ... | 450   | 0     | 0     | ... | 0     |
#            | Provider Earned from Employer  | 50    | 50    | 50    | ... | 50    | 0     | 0     | ... | 0     |
#            | Provider Paid by SFA           | 0     | 450   | 450   | ... | 450   | 450   | 0     | ... | 0     |
#            | Payment due from Employer      | 0     | 50    | 50    | ... | 50    | 50    | 0     | ... | 0     |
#            | Levy account debited           | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | SFA Levy employer budget       | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | SFA Levy co-funding budget     | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | SFA non-Levy co-funding budget | 450   | 450   | 450   | ... | 450   | 450   | 0     | ... | 0     |
#        
#        And OBSOLETE - the earnings and payments break down for provider b is as follows:
#            | Type                           | 08/18 | ... | 06/19 | 07/19 | 08/19 | 09/19 | 10/19 | 11/19 |
#            | Provider Earned Total          | 0     | ... | 720   | 720   | 720   | 720   | 720   | 0     |
#            | Provider Earned from SFA       | 0     | ... | 648   | 648   | 648   | 648   | 648   | 0     |
#            | Provider Earned from Employer  | 0     | ... | 72    | 72    | 72    | 72    | 72    | 0     |
#            | Provider Paid by SFA           | 0     | ... | 0     | 648   | 648   | 648   | 648   | 648   |
#            | Payment due from Employer      | 0     | ... | 0     | 72    | 72    | 72    | 72    | 72    |
#            | Levy account debited           | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy employer budget       | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy co-funding budget     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | SFA non-Levy co-funding budget | 0     | ... | 648   | 648   | 648   | 648   | 648   | 0     |

#Notes: New steps for multiple Providers

Scenario Outline: Non-Levy learner changes provider but remains with the same employer and there is a gap PV2-324
	Given "provider a" previously submitted the following learner details
        | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
        | 06/Aug/Current Academic Year | 12 months        | 6000                 | 06/Aug/Current Academic Year        | 1500                  | 06/Aug/Current Academic Year         | 7 months        | withdrawan        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 500          | 0          | 0         |
        | Sep/Current Academic Year | 500          | 0          | 0         |
        | Oct/Current Academic Year | 500          | 0          | 0         |
        | Nov/Current Academic Year | 500          | 0          | 0         |
        | Dec/Current Academic Year | 500          | 0          | 0         |
        | Jan/Current Academic Year | 500          | 0          | 0         |
        | Feb/Current Academic Year | 500          | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         | 
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |
	And the following payments had been generated for "provider a"
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 450                    | 50                          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 450                    | 50                          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 450                    | 50                          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         |
	But the Learner has now changed to "provider b" as follows
        | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
        | 06/Jun/Current Academic Year | 5 months         | 3000                 | 06/Jun/Current Academic Year        | 500                   | 06/Jun/Current Academic Year         |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
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
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 720          | 0          | 0         |
        | Jul/Current Academic Year | 720          | 0          | 0         |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R11/Current Academic Year | Jun/Current Academic Year | 720          | 0          | 0         |
        | R12/Current Academic Year | Jul/Current Academic Year | 720          | 0          | 0         |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R11/Current Academic Year | Jun/Current Academic Year | 648                    | 72                          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 648                    | 72                          | Learning         |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R11/Current Academic Year | Jun/Current Academic Year | 648                    | 72                          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 648                    | 72                          | Learning         |
	Examples:
		| Collection_Period         |
		| R11/Current Academic Year |
		| R12/Current Academic Year |