#Scenario:AC4- 1 learner aged 19-24, employed with a small employer at start, is co-funded for on programme and completion payments (this apprentice does not have a Education Health Care plan and is not a care leaver)
#
#    When an ILR file is submitted with the following data:
#        | ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | Employment Status  | Employment Status Applies | Employer Id | Small Employer | LearnDelFAM |
#        | learner a | 19-24 programme only non-DAS | 7500         | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 403            | 2              | 1            | In paid employment | 05/08/2018                | 12345678    | SEM1           |             |
#	And the employment status in the ILR is:
#        | Employer    | Employment Status      | Employment Status Applies | Small Employer |
#        | employer 1  | in paid employment     | 06/08/2018                | SEM1           |
#    Then the provider earnings and payments break down as follows:
#        | Type                           | 08/18 | 09/18 | 10/18 | ... | 08/19 | 09/19 |
#        | Provider Earned Total          | 500   | 500   | 500   | ... | 1500  | 0     |
#        | Provider Earned from SFA       | 450   | 450   | 450   | ... | 1350  | 0     |
#        | Provider Earned from Employer  | 50    | 50    | 50    | ... | 150   | 0     |
#        | Provider Paid by SFA           | 0     | 450   | 450   | ... | 450   | 1350  |
#        | Payment due from Employer      | 0     | 50    | 50    | ... | 50    | 150   |
#        | Levy account debited           | 0     | 0     | 0     | ... | 0     | 0     |
#        | SFA Levy employer budget       | 0     | 0     | 0     | ... | 0     | 0     |
#        | SFA Levy co-funding budget     | 0     | 0     | 0     | ... | 0     | 0     |
#        | SFA non-Levy co-funding budget | 450   | 450   | 450   | ... | 1350  | 0     |
#    
#    And the transaction types for the payments are:
#        | Payment type | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 |
#        | On-program   | 450   | 450   | 450   | ... | 450   | 0     |
#        | Completion   | 0     | 0     | 0     | ... | 0     | 1350  |
#        | Balancing    | 0     | 0     | 0     | ... | 0     | 0     |

Scenario Outline: Non-levy learner 19-24 not a care leaver or with EHC plan employed with a small employer is co-funded PV2-330
#AC4- 1 learner aged 19-24, employed with a small employer at start, is co-funded for on programme and completion payments (this apprentice does not have a Education Health Care plan and is not a care leaver)
#Confirm funding line type - if this should be 19-24 or 16-18 is OK??
	Given the provider previously submitted the following learner details
		| Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 1        | 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 19-24 programme only non-DAS |             | 19-24 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 06/Aug/Last Academic Year | SEM1           |
    And the following earnings had been generated for the learner in the "Last Academic Year"
        | Delivery Period        | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift |
        | Aug/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Sep/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Oct/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Nov/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Dec/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Jan/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Feb/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Mar/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Apr/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | May/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Jun/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
        | Jul/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
    And the following provider payments had been generated in the "Last Academic Year"
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
        | R01/Last Academic Year | Jul/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R02/Last Academic Year | Aug/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R03/Last Academic Year | Sep/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R04/Last Academic Year | Oct/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R05/Last Academic Year | Nov/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R06/Last Academic Year | Dec/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R07/Last Academic Year | Jan/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R08/Last Academic Year | Feb/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R09/Last Academic Year | Mar/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R10/Last Academic Year | Apr/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R11/Last Academic Year | May/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
        | R12/Last Academic Year | Jun/Last Academic Year | 450                    | 50                          | 0                         | Learning         |
    But the Provider now changes the Learner details as follows
		| Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 1        | 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 19-24 programme only non-DAS |             | 19-24 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 06/Aug/Last Academic Year | SEM1           |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period> in the "Current Academic Year"
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift |
		| Aug/Current Academic Year | 0            | 1500       | 0         | 0                        | 0                        | 0                           | 360                         | 0                          | 0                            |
		| Sep/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Oct/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Nov/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Dec/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Jan/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Feb/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Mar/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Apr/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| May/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Jun/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
		| Jul/Current Academic Year | 0            | 0          | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift |
		| R01/Current Academic Year | Aug/Current Academic Year | 0            | 1500       | 0         | 0                        | 0                        | 0                           | 0                           | 0                          | 0                            |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 1350                   | 150                         | 0                         | Completion       |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 1500                   | 0                           | 0                         | Completion       |
	Examples:
        | Collection_Period         |
		| R01/Current Academic Year |