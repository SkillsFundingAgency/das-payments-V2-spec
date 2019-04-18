#Feature: Additional Payments Incentives
#
#Scenario: Non Levy Learner finishes on time, earns on-programme and completion payments. Assumes 12 month apprenticeship and learner completes after 10 months.
#    
#	Given the apprenticeship funding band maximum is 9000
#    
#	When an ILR file is submitted with the following data:
#		| ULN    | learner type                 | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | employer contribution |
#		| 123456 | 16-18 programme only non-DAS | 9000         | 06/08/2018 | 09/08/2019       | 10/08/2019      | Completed         | 403            | 2              | 1            | 720                   |
#
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 06/19 | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total                   | 720   | 720   | 720   | 1720  | 720   | ... | 720   | 720   | 3160  | 0     |
#        | Provider Earned from SFA                | 660   | 660   | 660   | 1660  | 660   | ... | 660   | 660   | 2980  | 0     |
#        | Provider Earned from Employer           | 60    | 60    | 60    | 60    | 60    | ... | 60    | 60    | 180   | 0     |
#        | Provider Paid by SFA                    | 0     | 660   | 660   | 660   | 1660  | ... | 660   | 660   | 660   | 2980  |
#        | Payment due from Employer               | 0     | 60    | 60    | 60    | 60    | ... | 60    | 60    | 60    | 180   |
#        | Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#		| SFA non-Levy co-funding budget          | 540   | 540   | 540   | 540   | 540   | ... | 540   | 540   | 1620  | 0     |
#        | SFA non-Levy additional payments budget | 120   | 120   | 120   | 1120  | 120   | ... | 120   | 120   | 1360  | 0     |
#
#    And the transaction types for the payments are:
#        | Payment type                 | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 06/19 | 07/19 | 08/19 | 09/19 |
#        | On-program                   | 0     | 540   | 540   | 540   | 540   | ... | 540   | 540   | 540   | 0     |
#        | Completion                   | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 1620  |
#        | Balancing                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | 0     | 0     | 500   | ... | 0     | 0     | 0     | 500   |
#        | Provider 16-18 incentive     | 0     | 0     | 0     | 0     | 500   | ... | 0     | 0     | 0     | 500   |
#        | Framework uplift on-program  | 0     | 120   | 120   | 120   | 120   | ... | 120   | 120   | 120   | 0     |
#        | Framework uplift completion  | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 360   |
#        | Framework uplift balancing   | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | 0     | ..  | 0     | 0     | 0     | 0     |

	Feature: Additional Payment Incentives PV2-851

	Scenario: Non Levy Learner finishes on time, Price is less than Funding Band Maximum of �9,000

	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 9000                 | 06/Aug/Last Academic Year           |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |

    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | First16To18EmployerIncentive | First16To18ProviderIncentive | OnProgramme16To18FrameworkUplift |
        | Aug/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Sep/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Oct/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Nov/Last Academic Year | 600          | 0          | 0         | 500                          | 500                          | 120                              |
        | Dec/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jan/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Feb/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Mar/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Apr/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | May/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jun/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
        | Jul/Last Academic Year | 600          | 0          | 0         | 0                            | 0                            | 120                              |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type                 |
        | R01/Last Academic Year | Aug/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R02/Last Academic Year | Sep/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R03/Last Academic Year | Oct/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R04/Last Academic Year | Nov/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R05/Last Academic Year | Dec/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R06/Last Academic Year | Jan/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R07/Last Academic Year | Feb/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R08/Last Academic Year | Mar/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R09/Last Academic Year | Apr/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R10/Last Academic Year | May/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R11/Last Academic Year | Jun/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R12/Last Academic Year | Jul/Last Academic Year | 540                    | 60                          | 0                         | Learning                         |
        | R01/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R06/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R07/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R08/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R09/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R10/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R11/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R12/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 120                       | OnProgramme16To18FrameworkUplift |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 500                       | First16To18EmployerIncentive     |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 500                       | First16To18ProviderIncentive     |
		
    But the Provider now changes the Learner details as follows
		| Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 1        | 06/Aug/Last Academic Year | 12 months        | 9000                 | 06/Aug/Last Academic Year           |                        |                                       | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |

	When the amended ILR file is re-submitted for the learners in collection period R01/CurrentAcademic Year
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | Second16To18EmployerIncentive | Second16To18ProviderIncentive | Completion16To18FrameworkUplift |
		| Aug/Current Academic Year | 0            | 1650       | 0         | 500                           | 500                           | 360                             |
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

    And at Month end only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Second16To18EmployerIncentive | Second16To18ProviderIncentive |Completion16To18FrameworkUplift |
		| R01/Current Academic Year | Aug/Current Academic Year | 0            | 1800       | 0         | 500                           | 500                           |360                             |
			
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully Funded Payments | Transaction Type                |
		| R01/Current Academic Year | Aug/Current Academic Year | 1620                   | 180                         | 0                         | Completion                      |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 500                         | 0                         | Second16To18EmployerIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 500                         | 0                         | Second16To18ProviderIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Completion16To18FrameworkUplift |

	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully Funded Payments | Transaction Type                |
		| R01/Current Academic Year | Aug/Current Academic Year | 1620                   | 180                         | 0                         | Completion                      |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 500                         | 0                         | Second16To18EmployerIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 500                         | 0                         | Second16To18ProviderIncentive   |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 360                       | Completion16To18FrameworkUplift |