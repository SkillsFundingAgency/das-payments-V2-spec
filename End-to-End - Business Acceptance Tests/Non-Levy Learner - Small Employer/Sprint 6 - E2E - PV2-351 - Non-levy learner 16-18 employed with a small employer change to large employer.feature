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

Scenario: Non-levy learner 16-18 employed with a small employer change to large employer PV2-351
# Multiple employers
 #	And the employment status in the ILR is
 #       | Employer   | Employment Status  | Employment Status Applies | Small Employer |
 #       | employer 1 | in paid employment | 05/Aug/Last Academic Year | SEM1           |
 #       | employer 2 | in paid employment | 05/Oct/Last Academic Year |                |

# Differences from 255 
# New "price details as follows" table in the history and SFA Contribution Percentage is moved to this table

	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
		# New table in the history and SFA Contribution Percentage is moved to this table
	And price details as follows
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | SFA Contribution Percentage |
        | 1st price details | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | 100%                        |
        | 1st price details | 7500                 | 05/Oct/Last Academic Year           | 0                      | 05/Oct/Last Academic Year             | 90%                         |
	# 100% funding initially as small employer but changed to 90% when switched to large employer
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | First16To18EmployerIncentive | First16To18ProviderIncentive | OnProgramme16To18FrameworkUplift |
        | Aug/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Sep/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Oct/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Nov/Last Academic Year | 500          | 0          | 0         | 500                          | 500                          | 120                              |
        | Dec/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jan/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Feb/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Mar/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Apr/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | May/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jun/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jul/Last Academic Year | 500          | 0          | 0         | 0                            | 0                            | 120                              |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type                 |
		# 100%
        | R01/Last Academic Year | Jul/Last Academic Year | 500                    | 0                           | 0                         | Learning                         |
        | R02/Last Academic Year | Aug/Last Academic Year | 500                    | 0                           | 0                         | Learning                         |
        | R01/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R02/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
		# 90%
        | R03/Last Academic Year | Sep/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R04/Last Academic Year | Oct/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R05/Last Academic Year | Nov/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R06/Last Academic Year | Dec/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R07/Last Academic Year | Jan/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R08/Last Academic Year | Feb/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R09/Last Academic Year | Mar/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R10/Last Academic Year | Apr/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R11/Last Academic Year | May/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R12/Last Academic Year | Jun/Last Academic Year | 450                    | 50                          | 0                         | Learning                         |
        | R03/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R05/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R06/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R07/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R08/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R09/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R10/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R11/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R12/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
		# Incentive
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | First16To18EmployerIncentive     |
        | R04/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 500                       | First16To18ProviderIncentive     |
    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 7500                 | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period "R01/Current Academic Year"
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | Second16To18EmployerIncentive | Second16To18ProviderIncentive | Completion16To18FrameworkUplift |
		| Aug/Current Academic Year | 0            | 1500       | 0         | 500                           | 500                           | 360                             |
		| Sep/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Oct/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Nov/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Dec/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Jan/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Feb/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Mar/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Apr/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| May/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Jun/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
		| Jul/Current Academic Year | 0            | 0          | 0         | 0                             | 0                             | 0                               |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Second16To18EmployerIncentive | Second16To18ProviderIncentive | Completion16To18FrameworkUplift |
		| R01/Current Academic Year | Aug/Current Academic Year | 0            | 1500       | 0         | 500                           | 500                           | 360                             |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type                |
		| R01/Current Academic Year | Aug/Current Academic Year | 1350                   | 150                         | 0                         | Completion                      |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Second16To18EmployerIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Second16To18ProviderIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Completion16To18FrameworkUplift |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type                |
		| R01/Current Academic Year | Aug/Current Academic Year | 1350                   | 150                         | 0                         | Completion                      |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Second16To18EmployerIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500                       | Second16To18ProviderIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Completion16To18FrameworkUplift |