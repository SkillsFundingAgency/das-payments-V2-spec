#Feature: Provider earnings and payments where learner changes apprenticeship standard and there is a change to the negotiated price at the end of a month, (remaining with the same employer and provider)
#
#Scenario: Levy learner, changes standard, negotiated price remains the same	
#
#	Given The learner is programme only DAS
#	And the apprenticeship funding band maximum is 17000
#	And levy balance > agreed price for all months
#		
#	And the following commitments exist:
#		| ULN       | priority | start date | end date   | agreed price |
#        | learner a | 1        | 03/08/2018 | 01/08/2019 | 15000        |
#
# 
#	When an ILR file is submitted with the following data:
#        | ULN       | standard code | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | learner a | 51            | 03/08/2018 | 01/08/2019       | 01/11/2018      | withdrawn         | 12000                | 03/08/2018                          | 3000                   | 01/08/2018                            |
#        | learner a | 52            | 03/11/2018 | 01/08/2019       |                 | continuing        | 12000                | 03/11/2018                          | 3000                   | 03/11/2018                            |
#       		
#	Then the provider earnings and payments break down as follows:
#		
#        | Type                       		| 08/18   | 09/18   | 10/18   | 11/18   | 12/18   |
#        | Provider Earned Total      		| 1000    | 1000    | 1000    | 1333.33 | 1333.33 | (On-program payment for new standard spread over 9mths)
#        | Provider Earned from SFA   		| 1000    | 1000    | 1000    | 1333.33 | 1333.33 |
#        | Provider Earned from Employer 	| 0       |    0    |    0    |    0    |    0    |            
#		| Provider Paid by SFA       		| 0       | 1000    | 1000    | 1000    | 1333.33 |
#        | Payment due from Employer         | 0       |    0    |    0    |    0    |    0    | 
#		| Levy account debited       		| 0       | 1000    | 1000    | 1000    | 1333.33 |
#        | SFA Levy employer budget   		| 1000    | 1000    | 1000    | 1333.33 | 1333.33 |
#        | SFA Levy co-funding budget 		| 0       |    0    |    0    |    0    |    0    |
#		| SFA non-Levy co-funding budget	| 0       |    0    |    0    |    0    |    0    | 			
#
#	And the transaction types for the payments are:
#		| Payment type                   | 09/18 | 10/18 | 11/18 | 12/18   |
#		| On-program                     | 1000  | 1000  | 1000  | 1333.33 |
#		| Completion                     | 0     | 0     | 0     | 0       |
#		| Balancing                      | 0     | 0     | 0     | 0       |
#		| English and maths on programme | 0     | 0     | 0     | 0       |
#		| English and maths Balancing    | 0     | 0     | 0     | 0       |


# This test needs to be discussed with David Young. Changes may also apply to Non-Levy version.
    Scenario Outline: Levy learner change to standard at the end of a month no change in price PV2-426

	Given the employer levy account balance is 18500

	And the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 03/Aug/Current Academic Year | 12 months        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 01/Aug/Current Academic Year          | 3 months        | withdrawn         | Act1          | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |

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
        | Apr/Current Academic Year | 1000         | 0          | 0         |
        | May/Current Academic Year | 1000         | 0          | 0         |
        | Jun/Current Academic Year | 1000         | 0          | 0         |
        | Jul/Current Academic Year | 1000         | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning         |        
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 03/Nov/Current Academic Year | 9 months         | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 52            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>	 
	# Review
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 0            | 0          | 0         |
        | Sep/Current Academic Year | 0            | 0          | 0         |
        | Oct/Current Academic Year | 0            | 0          | 0         |
        | Nov/Current Academic Year | 1333.33      | 0          | 0         |
        | Dec/Current Academic Year | 1333.33      | 0          | 0         |	
        | Jan/Current Academic Year | 1333.33      | 0          | 0         |
        | Feb/Current Academic Year | 1333.33      | 0          | 0         |
        | Mar/Current Academic Year | 1333.33      | 0          | 0         |
        | Apr/Current Academic Year | 1333.33      | 0          | 0         |
        | May/Current Academic Year | 1333.33      | 0          | 0         |
        | Jun/Current Academic Year | 1333.33      | 0          | 0         |
        | Jul/Current Academic Year | 1333.33      | 0          | 0         |

    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R04/Current Academic Year | Nov/Current Academic Year | 1333.33      | 0          | 0         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1333.33      | 0          | 0         |

    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type |
        | R04/Current Academic Year | Nov/Current Academic Year | 1333.33           | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1333.33           | Learning         |

    And only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type |
        | R04/Current Academic Year | Nov/Current Academic Year | 1333.33           | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1333.33           | Learning         |

	Examples: 
        | Collection_Period         |
        | R04/Current Academic Year |
        | R05/Current Academic Year |