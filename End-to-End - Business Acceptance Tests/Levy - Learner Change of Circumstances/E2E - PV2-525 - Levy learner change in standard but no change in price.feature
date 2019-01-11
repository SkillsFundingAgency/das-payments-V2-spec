Feature: Learner Change in Circumstance

#Scenario: Levy learner change to standard in ILR but no change in price	
#
#        Given The learner is programme only DAS
#        And the apprenticeship funding band maximum is 17000
#		And the total price is 15000
#        And levy balance > agreed price for all months
#		And the following commitments exist:
#
#            | ULN       | start date | end date   | agreed price |
#            | learner a | 01/08/2018 | 03/08/2019 | 15000        |
# 
#		When an ILR file is submitted in R01 (Aug 2018) with the following data:
#            | ULN       | standard code | start date | planned end date | completion status | Total training price | Total training price effective date | Total assessment price |
#            | learner a | 51            | 01/08/2018 | 03/08/2019       | continuing        | 12000                | 01/08/2018                          | 3000                   |
#       		
#		Then the provider earnings and payments break down as follows:
#		
#            | Type                       		| 08/18 | 09/18 | 10/18 | 
#            | Provider Earned Total      		| 1000  | 1000  | 1000  | 
#            | Provider Earned from SFA   		| 1000  | 1000  | 1000  | 
#            | Provider Earned from Employer 	| 0     | 0     | 0     |             
#			| Provider Paid by SFA       		| 0     | 1000  | 1000  | 
#			| Refund taken by SFA               | 0     | 0     | 0     | 
#            | Payment due from Employer         | 0     | 0     | 0     |
#			| Refund due to employer            | 0     | 0     | 0     |
#			| Levy account debited       		| 0     | 1000  | 1000  | 
#            | SFA Levy employer budget   		| 1000  | 1000  | 1000  | 
#            | SFA Levy co-funding budget 		| 0     | 0     | 0     | 
#			| SFA non-Levy co-funding budget	| 0     | 0     | 0     |  
#			
#        And the transaction types for the payments are:
#            | Payment type                 | 09/18 | 10/18 | 
#            | On-program                   | 1000  | 1000  | 
#            | Completion                   | 0     | 0     | 
#            | Balancing                    | 0     | 0     | 
#            | Employer 16-18 incentive     | 0     | 0     | 
#            | Provider 16-18 incentive     | 0     | 0     | 
#		
#		
#		
#		When an ILR file is submitted in R03 (Oct 2018) with the following data:
#            | ULN       | standard code | start date | planned end date | completion status | Total training price | Total training price effective date | Total assessment price |
#            | learner a | 52            | 01/08/2018 | 03/08/2019       | continuing        | 12000                | 01/08/2018                          | 3000                   |
#       		
#		Then the provider earnings and payments break down as follows:
#		
#            | Type                       		| 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
#            | Provider Earned Total      		| 1000  | 1000  | 1000  | 1000  | 1000  |
#            | Provider Earned from SFA   		| 1000  | 1000  | 1000  | 1000  | 1000  |
#            | Provider Earned from Employer 	| 0     | 0     | 0     | 0     | 0     |            
#			| Provider Paid by SFA       		| 0     | 0     | 0     | 3000  | 1000  |
#			| Refund taken by SFA               | 0     | 0     | 0     | -2000 | 0     | 
#            | Payment due from Employer         | 0     | 0     | 0     | 0     | 0     |
#			| Refund due to employer            | 0     | 0     | 0     | -2000 | 0     | 
#			| Levy account debited       		| 0     | 0     | 0     | 3000  | 1000  |
#            | SFA Levy employer budget   		| 1000  | 1000  | 1000  | 3000  | 1000  |
#            | SFA Levy co-funding budget 		| 0     | 0     | 0     | 0     | 0     |
#			| SFA non-Levy co-funding budget	| 0     | 0     | 0     | 0     | 0     | 
#			
#        And the transaction types for the payments are:
#            | Payment type                 | 09/18 | 10/18 | 11/18 |12/18 |
#            | On-program                   | 1000  | 1000  | 1000  |1000  |
#            | Completion                   | 0     | 0     | 0     |0     |
#            | Balancing                    | 0     | 0     | 0     |0     |
#            | Employer 16-18 incentive     | 0     | 0     | 0     |0     |
#            | Provider 16-18 incentive     | 0     | 0     | 0     |0     |

Scenario Outline: Levy learner change to standard in ILR but no change in price PV2-525

	Given the employer levy account balance is 17000

	And The following commitment exists
		| commitment Id | version Id | ULN       | start date                   | end date                     | status | agreed price | Standard Code |
		| 1             | 1          | learner a | 01/Aug/Current Academic Year | 31/Jul/Current Academic Year | active | 15000        | 51            |

	And the provider previously submitted the following learner details
        | ULN       | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  |
        | learner a | 1        | 01/Aug/Current Academic Year | 12 months        | 12000                | 01/Aug/Current Academic Year        | 3000                  | 01/Aug/Current Academic Year         | continuing        | 0.90                        | ContractWithEmployer | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract |

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
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000              | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000              | Learning         |
 

        
    But The commitment is now changed as follows 
		| commitment Id | version Id | ULN       | start date                   | end date                     | status | agreed price | Standard Code |
		| 1             | 2          | learner a | 01/Aug/Current Academic Year | 31/Jul/Current Academic Year | active | 15000        | 52            |

	And the Provider now changes the Learner details as follows
        | ULN       | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  |
        | learner a | 1        | 01/Aug/Current Academic Year | 12 months        | 12000                | 01/Aug/Current Academic Year        | 3000                  | 01/Aug/Current Academic Year         | continuing        | .9                          | ContractWithEmployer | 1                   | ZPROG001      | 52            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract |
		 
	When the amended ILR file is re-submitted for the learners in collection period R03/Current Academic Year

    Then the following learner earnings should be generated
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

    And the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |Standard Code |
        | R03/Current Academic Year | Aug/Current Academic Year | -1000        | 0          | 0         | 51           |
        | R03/Current Academic Year | Sep/Current Academic Year | -1000        | 0          | 0         | 51           |
        | R03/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         | 52           |
        | R03/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         | 52           |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         | 52           |

    And the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type | Standard Code |
        | R03/Current Academic Year | Aug/Current Academic Year | -1000             | Learning         | 51            |
        | R03/Current Academic Year | Sep/Current Academic Year | -1000             | Learning         | 51            |
        | R03/Current Academic Year | Aug/Current Academic Year | 1000              | Learning         | 52            |
        | R03/Current Academic Year | Sep/Current Academic Year | 1000              | Learning         | 52            |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000              | Learning         | 52            |

    And at month end the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type | Standard Code |
        | R03/Current Academic Year | Aug/Current Academic Year | -1000             | Learning         | 51            |
        | R03/Current Academic Year | Sep/Current Academic Year | -1000             | Learning         | 51            |
        | R03/Current Academic Year | Aug/Current Academic Year | 1000              | Learning         | 52            |
        | R03/Current Academic Year | Sep/Current Academic Year | 1000              | Learning         | 52            |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000              | Learning         | 52            |

		Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
