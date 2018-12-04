#@SmallEmployerMultipleEmploymentStatus
#Scenario:- Payment for a 16-18 non-levy learner, small employer at start, change to large employer
#	Given the apprenticeship funding band maximum is 9000
#	When an ILR file is submitted with the following data:
#		| ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | 
#		| learner a | 16-18 programme only non-DAS | 7500         | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 403            | 2              | 1            | 
#    
#    And the employment status in the ILR is
#		| Employer    | Employment Status  | Employment Status Applies | Small Employer |
#		| employer 1  | in paid employment | 05/08/2018                | SEM1           |
#		| employer 2  | in paid employment | 05/10/2018                |                |
#	
#    Then the provider earnings and payments break down as follows:
#		| Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
#		| Provider Earned Total                   | 620   | 620   | 620   | 1620  | 620   | ... | 2860  | 0     |
#		| Provider Earned from SFA                | 620   | 620   | 570   | 1570  | 570   | ... | 2710  | 0     |
#		| Provider Earned from Employer           | 0     | 0     | 50    | 50    | 50    | ... | 150   | 0     |
#		| Provider Paid by SFA                    | 0     | 620   | 620   | 570   | 1570  | ... | 570   | 2710  |
#		| Payment due from Employer 2             | 0     | 0     | 0     | 50    | 50    | ... | 50    | 150   |
#		| Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| SFA non-Levy co-funding budget          | 500   | 500   | 450   | 450   | 450   | ... | 1350  | 0     |
#		| SFA non-Levy additional payments budget | 120   | 120   | 120   | 1120  | 120   | ... | 1360  | 0     |
#	
#    And the transaction types for the payments are:
#		| Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
#		| On-program                   | 500   | 500   | 450   | 450   | ... | 450   | 0     |
#		| Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 1350  |
#		| Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| Employer 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
#		| Provider 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
#		| Framework uplift on-program  | 120   | 120   | 120   | 120   | ... | 120   | 0     |
#		| Framework uplift completion  | 0     | 0     | 0     | 0     | ... | 0     | 360   |
#		| Framework uplift balancing   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| Provider disadvantage uplift | 0     | 0     | 0     | 0     | ..  | 0     | 0     |

Scenario Outline: Non-levy learner 16-18 employed with a small employer change to large employer PV2-351
# Notes: Multiple employers
# Review new column in payments tables
# New table for employment status
# Incentives
# New field - LearnDelFAM
	Given the provider previously submitted the following learner details in collection period "R01/Current Academic Year" 
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 programme only non-DAS |             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 100%                        |
	And the employment status in the ILR is
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
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            | Employer   |
        | R01/Last Academic Year | Jul/Last Academic Year | 500                    | 0                           | 0                         | Learning                    | employer 1 |
        | R02/Last Academic Year | Aug/Last Academic Year | 500                    | 0                           | 0                         | Learning                    | employer 1 |
        | R01/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 1 |
        | R02/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 1 |
    And the provider previously submitted the following learner details in collection period "R03/Current Academic Year" 
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 programme only non-DAS |             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 05/Aug/Last Academic Year | SEM1           |
        | employer 2 | in paid employment | 05/Oct/Last Academic Year |                |
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
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            | Employer   |
        | R03/Last Academic Year | Sep/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R04/Last Academic Year | Oct/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R05/Last Academic Year | Nov/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R06/Last Academic Year | Dec/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R07/Last Academic Year | Jan/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R08/Last Academic Year | Feb/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R09/Last Academic Year | Mar/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R10/Last Academic Year | Apr/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R11/Last Academic Year | May/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R12/Last Academic Year | Jun/Last Academic Year | 450                    | 50                          | 0                         | Learning                    | employer 2 |
        | R03/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R05/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R06/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R07/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R08/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R09/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R10/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R11/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R12/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 120                       | Framework uplift on-program | employer 2 |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    | employer 2 |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    | employer 2 |
    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Learner Type                 | LearnDelFAM | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 programme only non-DAS |             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is
        | Employer   | Employment Status  | Employment Status Applies | Small Employer |
        | employer 1 | in paid employment | 05/Aug/Last Academic Year | SEM1           |
        | employer 2 | in paid employment | 05/Oct/Last Academic Year |                |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
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
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Employer 16-18 incentive | Provider 16-18 incentive | Framework uplift on-program | Framework uplift completion | Framework uplift balancing | Provider disadvantage uplift | Employer   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0            | 1500       | 0         | 500                      | 500                      | 0                           | 360                         | 0                          | 0                            | employer 2 |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            | Employer   |
		| R01/Current Academic Year | Aug/Current Academic Year | 1350                   | 150                         | 0                         | Completion                  | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Framework uplift completion | employer 2 |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type            | Employer   |
		| R01/Current Academic Year | Aug/Current Academic Year | 1350                   | 150                         | 0                         | Completion                  | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Employer 16-18 incentive    | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Provider 16-18 incentive    | employer 2 |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Framework uplift completion | employer 2 |
	Examples:
        | Collection_Period         |
        | R01/Current Academic Year |