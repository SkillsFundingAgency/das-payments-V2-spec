#Feature: Additional Payments Incentives
#
#Scenario: Payment for a 16-18 Levy learner, levy available, 90 day incentive earned, price change after 90 day incentive received
#    
#    Given levy balance > agreed price for all months
#    
#	And the following commitments exist:
#        | commitment Id | version Id | ULN       | learner type             | start date | end date   | agreed price | effective from | effective to |
#        | 1             | 1-001      | learner a | 16-18 programme only DAS | 01/08/2018 | 01/08/2019 | 15000        | 01/08/2018     | 22/01/2019   |
#		| 1             | 1-002      | learner a | 16-18 programme only DAS | 01/08/2018 | 01/08/2019 | 5250         | 23/01/2019     |              |
#
#    When an ILR file is submitted with the following data:
#        | ULN       | learner type             | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | learner a | 16-18 programme only DAS | 20/08/2018 | 20/08/2019       | 22/01/2019      | withdrawn         | 12000                | 20/08/2018                          | 3000                   | 20/08/2018                            |
#        | learner a | 16-18 programme only DAS | 23/01/2019 | 20/08/2019       |                 | continuing        | 4200                 | 23/01/2019                          | 1050                   | 23/01/2019                            |
#
#       
#    Then the provider earnings and payments break down as follows:
#        | Type                                | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total               | 1000  | 1000  | 1000  | 2000  | 1000  | 600   | 600   | ... | 600   | 1000  | 0     |
#        | Provider Earned from SFA            | 1000  | 1000  | 1000  | 2000  | 1000  | 600   | 600   | ... | 600   | 1000  | 0     |
#		| Provider Earned from Employer       | 0     | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Provider Paid by SFA                | 0     | 1000  | 1000  | 1000  | 2000  | 1000  | 600   | ... | 600   | 600   | 1000  |
#        | Payment due from Employer           | 0     | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Levy account debited                | 0     | 1000  | 1000  | 1000  | 1000  | 1000  | 600   | ... | 600   | 600   | 0     |
#        | SFA Levy employer budget            | 1000  | 1000  | 1000  | 1000  | 1000  | 600   | 600   | ... | 600   | 0     | 0     |
#        | SFA Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy additional payments budget | 0     | 0     | 0     | 1000  | 0     | 0     | 0     | ... | 0     | 1000  | 0     |
#
#    And the transaction types for the payments are:
#        | Payment type             | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... | 07/19 | 08/19 | 09/19 |
#        | On-program               | 1000  | 1000  | 1000  | 1000  | 1000  | 600   | ... | 600   | 600   | 0     |
#        | Completion               | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Balancing                | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Employer 16-18 incentive | 0     | 0     | 0     | 500   | 0     | 0     | ... | 0     | 0     | 500   |
#        | Provider 16-18 incentive | 0     | 0     | 0     | 500   | 0     | 0     | ... | 0     | 0     | 500   |

Feature: Additional Payments Incentives PV2-914

Scenario Outline: Payment for a 16-18 Levy learner, levy available, 90 day incentive earned, price change after 90 day incentive received PV2-914

Given the employer levy account balance in collection period <Collection_Period> is <Levy_Balance>
	
	And the following apprenticeships exist
		| framework code | programme type | pathway code | agreed price | start date                   | end date                  | effective from               | effective from               |
		| 593            | 20             | 1            | 15000        | 01/Aug/Current Academic Year | 01/Aug/Next Academic Year | 20/Aug/Current Academic Year | 22/Jan/Current Academic Year |
		| 593            | 20             | 1            | 5250         | 01/Aug/Current Academic Year | 01/Aug/Next Academic Year | 23/Jan/Current Academic Year |                              |

	And the provider is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assesment Price Effective Date | Completion Status | SFA Contribution Percentage | Contract Type | Aim Sequence Number | Aim Reference | framework code | programme type | pathway code | Funding Line Type         |
		| 20/Aug/Current Academic Year | 12 months        | 5250                 | 23/Jan/Current Academic Year        |                        |                                      | continuing        | 90%                         | Act1          | 1                   | ZPROG001      | 593            | 20             | 1            | 16-18 Apprenticeship Levy |

	And price details as follows		
		| Price Episode Id | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
		| pe-1             | 15000                | 01/Aug/Current Academic Year        |                        |                                       | Act1          | 1                   | 90%                         |
		| pe-2             | 5250                 | 23/Jan/Current Academic Year        |                        |                                       | Act1          | 1                   | 90%                         |
	
	When the ILR file is submitted for the learners for collection period <Collection_Period>
	Then the following learner earnings should be generated
	    | Delivery Period           | On-Programme | Completion | Balancing | Aim Sequence Number | Price Episode Identifier | First16To18EmployerIncentive | First16To18ProviderIncentive | Second16To18EmployerIncentive | Second16To18ProviderIncentive |
	    | Aug/Current Academic Year | 1000         | 0          | 0         | 1                   | pe-1                     | 0                            | 0                            | 0                             | 0                             |
	    | Sep/Current Academic Year | 1000         | 0          | 0         | 1                   | pe-1                     | 0                            | 0                            | 0                             | 0                             |
	    | Oct/Current Academic Year | 1000         | 0          | 0         | 1                   | pe-1                     | 0                            | 0                            | 0                             | 0                             |
	    | Nov/Current Academic Year | 1000         | 0          | 0         | 1                   | pe-1                     | 500                          | 500                          | 0                             | 0                             |
	    | Dec/Current Academic Year | 1000         | 0          | 0         | 1                   | pe-1                     | 0                            | 0                            | 0                             | 0                             |
	    | Jan/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Feb/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Mar/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Apr/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | May/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Jun/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Jul/Current Academic Year | 600          | 0          | 0         | 1                   | pe-2                     | 0                            | 0                            | 0                             | 0                             |
	    | Aug/Next Academic Year    | 0            | 1050       | 0         | 1                   | pe-2                     | 0                            | 0                            | 500                           | 500                           |
	
	And at month end only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | First16To18EmployerIncentive | First16To18ProviderIncentive | Second16To18EmployerIncentive | Second16To18ProviderIncentive |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R04/Current Academic Year | Nov/Current Academic Year | 100          | 0          | 0         | 500                          | 500                          | 0                             | 0                             |
		| R05/Current Academic Year | Dec/Current Academic Year | 100          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R06/Current Academic Year | Jan/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R07/Current Academic Year | Feb/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R08/Current Academic Year | Mar/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R09/Current Academic Year | Apr/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R10/Current Academic Year | May/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R11/Current Academic Year | Jun/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R12/Current Academic Year | Jul/Current Academic Year | 600          | 0          | 0         | 0                            | 0                            | 0                             | 0                             |
		| R01/Next Academic Year    | Aug/Next Academic Year    | 0            | 1050       | 0         | 0                            | 0                            | 500                           | 500                           |
	
	And only the following provider payments will be recorded
	    | Collection Period         | Delivery Period           | Levy Payments | Transaction Type              |
	    | R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning                      |
	    | R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning                      |
	    | R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning                      |
	    | R04/Current Academic Year | Nov/Current Academic Year | 100           | Learning                      |
	    | R05/Current Academic Year | Dec/Current Academic Year | 100           | Learning                      |
	    | R06/Current Academic Year | Jan/Current Academic Year | 600           | Learning                      |
	    | R07/Current Academic Year | Feb/Current Academic Year | 600           | Learning                      |
	    | R08/Current Academic Year | Mar/Current Academic Year | 600           | Learning                      |
	    | R09/Current Academic Year | Apr/Current Academic Year | 600           | Learning                      |
	    | R10/Current Academic Year | May/Current Academic Year | 600           | Learning                      |
	    | R11/Current Academic Year | Jun/Current Academic Year | 600           | Learning                      |
	    | R12/Current Academic Year | Jul/Current Academic Year | 600           | Learning                      |
	    | R01/Next Academic Year    | Aug/Next Academic Year    | 1050          | Completion                    |
	    | R04/Current Academic Year | Nov/Current Academic Year | 500           | First16To18EmployerIncentive  |
	    | R04/Current Academic Year | Nov/Current Academic Year | 100           | First16To18ProviderIncentive  |
	    | R01/Next Academic Year    | Nov/Current Academic Year | 100           | Second16To18EmployerIncentive |
	    | R01/Next Academic Year    | Nov/Current Academic Year | 100           | Second16To18ProviderIncentive |

	And only the following provider payments will be generated
	| Collection Period         | Delivery Period           | Levy Payments | Transaction Type              |
	| R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning                      |
	| R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning                      |
	| R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning                      |
	| R04/Current Academic Year | Nov/Current Academic Year | 100           | Learning                      |
	| R05/Current Academic Year | Dec/Current Academic Year | 100           | Learning                      |
	| R06/Current Academic Year | Jan/Current Academic Year | 600           | Learning                      |
	| R07/Current Academic Year | Feb/Current Academic Year | 600           | Learning                      |
	| R08/Current Academic Year | Mar/Current Academic Year | 600           | Learning                      |
	| R09/Current Academic Year | Apr/Current Academic Year | 600           | Learning                      |
	| R10/Current Academic Year | May/Current Academic Year | 600           | Learning                      |
	| R11/Current Academic Year | Jun/Current Academic Year | 600           | Learning                      |
	| R12/Current Academic Year | Jul/Current Academic Year | 600           | Learning                      |
	| R01/Next Academic Year    | Aug/Next Academic Year    | 1050          | Completion                    |
	| R04/Current Academic Year | Nov/Current Academic Year | 500           | First16To18EmployerIncentive  |
	| R04/Current Academic Year | Nov/Current Academic Year | 500           | First16To18ProviderIncentive  |
	| R01/Next Academic Year    | Nov/Current Academic Year | 500           | Second16To18EmployerIncentive |
	| R01/Next Academic Year    | Nov/Current Academic Year | 500           | Second16To18ProviderIncentive |
	
	Examples: 
		| Collection_Period         | Levy Balance |
		| R01/Current Academic Year | 1100         |
		| R02/Current Academic Year | 1100         |
		| R03/Current Academic Year | 1100         |
		| R04/Current Academic Year | 1100         |
		| R05/Current Academic Year | 1100         |
		| R06/Current Academic Year | 1100         |
		| R07/Current Academic Year | 1100         |
		| R08/Current Academic Year | 1100         |
		| R09/Current Academic Year | 1100         |
		| R10/Current Academic Year | 1100         |
		| R11/Current Academic Year | 1100         |
		| R12/Current Academic Year | 1100         |
		| R01/Next Academic Year    | 1100         |