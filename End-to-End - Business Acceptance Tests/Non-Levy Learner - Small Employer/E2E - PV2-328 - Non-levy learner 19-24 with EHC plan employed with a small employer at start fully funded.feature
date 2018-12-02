#@SmallEmployerNonDas
#@_Minimum_Acceptance_
#
#Scenario:AC2- 1 learner aged 19-24, non-levy, with an Education Health Care (EHC) plan, In paid employment with a small employer at start, is fully funded for on programme and completion payments
##Note: EHC plans are flagged on the ILR through Eligibility for Enhanced Funding (EEF) code = 2*
#	
#    Given the apprenticeship funding band maximum is 9000
#    When an ILR file is submitted with the following data:
#        | ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | Employment Status  | Employment Status Applies | Employer Id | Small Employer | LearnDelFAM |
#        | learner a | 19-24 programme only non-DAS | 7500         | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 403            | 2              | 1            | In paid employment | 05/08/2018                | 12345678    | SEM1           | EEF2        |
#	
#    And the employment status in the ILR is:
#        | Employer    | Employment Status      | Employment Status Applies | Small Employer |
#        | employer 1  | in paid employment     | 05/08/2018                | SEM1           |
#	
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total                   | 620   | 620   | 620   | 1620  | 620   | ... | 620   | 2860  | 0     |
#        | Provider Earned from SFA                | 620   | 620   | 620   | 1620  | 620   | ... | 620   | 2860  | 0     |
#        | Provider Earned from Employer           | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Provider Paid by SFA                    | 0     | 620   | 620   | 620   | 1620  | ... | 620   | 620   | 2860  |
#        | Payment due from Employer               | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget          | 500   | 500   | 500   | 500   | 500   | ... | 500   | 1500  | 0     |
#        | SFA non-Levy additional payments budget | 120   | 120   | 120   | 1120  | 120   | ... | 120   | 1360  | 0     |
#
#    And the transaction types for the payments are:
#        | Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
#        | On-program                   | 500   | 500   | 500   | 500   | ... | 500   | 0     |
#        | Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 1500  |
#        | Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
#        | Provider 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
#        | Framework uplift on-program  | 120   | 120   | 120   | 120   | ... | 120   | 0     |
#        | Framework uplift completion  | 0     | 0     | 0     | 0     | ... | 0     | 360   |
#        | Framework uplift balancing   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | ..  | 0     | 0     |

Scenario Outline: Non-levy learner 19-24 with an Education Health Care (EHC) plan employed with a small employer at start fully funded PV2-328
#Note: EHC plans are flagged on the ILR through Eligibility for Enhanced Funding (EEF) code = 2*
# New table for employment status
# Incentives
# New field - LearnDelFAM
	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 19-24 programme only non-DAS | EEF2        | 19-24 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 100%                        |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 05/Aug/Last Academic Year | SEM1           |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift |
        | Aug/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Sep/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Oct/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Nov/Last Academic Year | 500          | 0          | 0         | 500                      | 500                      | 120                         | 0                           | 0                          | 0                            |
        | Dec/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Jan/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Feb/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Mar/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Apr/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | May/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Jun/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
        | Jul/Last Academic Year | 500          | 0          | 0         | 0                        | 0                        | 120                         | 0                           | 0                          | 0                            |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            |
        | R01/Last Academic Year | Jul/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R02/Last Academic Year | Aug/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R03/Last Academic Year | Sep/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R04/Last Academic Year | Oct/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R05/Last Academic Year | Nov/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R06/Last Academic Year | Dec/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R07/Last Academic Year | Jan/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R08/Last Academic Year | Feb/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R09/Last Academic Year | Mar/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R10/Last Academic Year | Apr/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R11/Last Academic Year | May/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R12/Last Academic Year | Jun/Last Academic Year | 500                    | 0                           | 0                         | Learning                    |
        | R01/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R02/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R03/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R05/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R06/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R07/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R08/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R09/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R10/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R11/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R12/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    |
    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 19-24 programme only non-DAS | EEF2        | 19-24 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 100%                        |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 05/Aug/Last Academic Year | SEM1           |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period> in the "Current Academic Year"
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift |
		| Aug/Current Academic Year | 0            | 1500       | 0         | 500                      | 500                      | 0                           | 360                         | 0                          | 0                            |
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
		| R01/Current Academic Year | Aug/Current Academic Year | 0            | 1500       | 0         | 500                      | 500                      | 0                           | 360                         | 0                          | 0                            |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            |
		| R01/Current Academic Year | Aug/Current Academic Year | 1500                   | 0                           | 0                         | Completion                  |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Framework uplift completion |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            |
		| R01/Current Academic Year | Aug/Current Academic Year | 1500                   | 0                           | 0                         | Completion                  |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Framework uplift completion |
	Examples:
        | Collection_Period         |
        | R01/Current Academic Year |