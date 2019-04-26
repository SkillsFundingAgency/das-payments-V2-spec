#Feature: Transfers
#
#Scenario: 1 learner, no transfer funds available, receiving employer pays fully with their own Levy
#	
#    Given The learner is programme only DAS
#	And a transfer agreement has been set up between employer a and employer b 
#	And employer b's transfer allowance = 0 for all months
#	And employer a's levy balance > agreed price for all months
#	And the apprenticeship funding band maximum is 15000
#	
#	And the following commitments exist:
#	
#		| employer of apprentice | employer paying for training | ULN       | start date | end date   | standard code | agreed price | status     | effective from | effective to |
#		| employer a             | employer b                   | learner a | 01/05/2018 | 06/05/2019 | 50            | 15000        | continuing | 01/05/2018     |   		      |
#	
#	When an ILR file is submitted with the following data:
#        | ULN       | learner type           | agreed price | price effective from | start date | planned end date | actual end date | completion status | aim type   | aim sequence number | standard code |
#        | learner a | programme only DAS     | 15000        | 06/05/2018           | 06/05/2018 | 20/05/2019       |    		     | continuing        | programme  | 1                   | 50            |
#
#	Then the provider earnings and payments break down as follows:
#	      	
#		| Type                                    | 05/18  | 06/18  | 07/18  | 08/18   |
#        | Provider Earned Total                   | 1000   | 1000   | 1000   | 1000    |
#        | Provider Earned from SFA                | 1000   | 1000   | 1000   | 1000    |
#        | Provider Earned from employer a         | 0      | 0      | 0      | 0       |
#		| Provider Earned from employer b         | 0      | 0      | 0      | 0       |
#        | Provider Paid by SFA                    | 0      | 1000   | 1000   | 1000    |
#        | Refund taken by SFA                     | 0      | 0      | 0      | 0       |
#        | Payment due from employer a             | 0      | 0      | 0      | 0       |
#		| Payment due from employer b             | 0      | 0      | 0      | 0       |
#        | Refund due to employer a                | 0      | 0      | 0      | 0       |
#		| Refund due to employer b                | 0      | 0      | 0      | 0       |
#        | Levy account for employer a debited     | 0      | 1000   | 1000   | 1000    |
#		| Levy account for employer b debited     | 0      | 0      | 0      | 0       |
#        | Levy account for employer a credited    | 0      | 0      | 0      | 0       |
#		| Levy account for employer b credited    | 0      | 0      | 0      | 0       |
#        | SFA Levy employer budget                | 1000   | 1000   | 1000   | 1000    |
#        | SFA Levy co-funding budget              | 0      | 0      | 0      | 0       |
#        | SFA Levy additional payments budget     | 0      | 0      | 0      | 0       |
#        | SFA non-Levy co-funding budget          | 0      | 0      | 0      | 0       |
#        | SFA non-Levy additional payments budget | 0      | 0      | 0      | 0       |
#
#	And the following transfers from employer b exist:
#	
#		| recipient  | 05/18  | 06/18  | 07/18  | 08/18  | 
#		| employer a | 0      | 0      | 0      | 0      |

		

Feature: Single Levy learner no transfer levy available - PV2-737
	As a provider,
	I want a Levy learner, where the employer receives a transfer from another employer to fund the learner, 
	but no transfer funds are available and receiving employer pays with their own Levy
	So that I am accurately paid the apprenticeship amount by SFA - PV2-737

Scenario Outline: Transfers - Single Levy learner no transfer levy availble - PV2-737

	Given the "employer 1" levy account balance in collection period <Collection_Period> is <Levy Balance for employer 1>
	And  the "employer 2" levy account balance in collection period <Collection_Period> is <Levy Balance for employer 2>

	# new step - is it required?	
	And a transfer agreement has been set up between employer 1 and employer 2

	# Option 1
	And the following commitments exist 
		| employer of apprentice | employer paying for training | start date                   | end date                  | agreed price | standard code | status | effective from               |
		| employer 1             | employer 2                   | 01/Aug/Current Academic Year | 06/Aug/Next Academic Year | 15000        | 50            | active | 01/Aug/Current Academic Year |

# Option 2
#	And a transfer agreement has been set up between employer 1 and employer 2
#		| employer of apprentice | employer paying for training |
#		| employer 1             | employer 2                   |
#
#	And the following commitments exist 
#		| start date                   | end date                  | agreed price | standard code | status | effective from               |
#		| 01/Aug/Current Academic Year | 06/Aug/Next Academic Year | 15000        | 50            | active | 01/Aug/Current Academic Year |

    And the provider is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 15000                | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 50            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |

	When the ILR file is submitted for the learners for collection period <Collection_Period>
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
    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
	# New column - Transfer Payments
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | Levy Payments | Transfer Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | 0                 | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | 0                 | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | 0                 | Learning         |
	And only the following provider payments will be generated
        | Collection Period         | Delivery Period           | Levy Payments | Transfer Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | 0                 | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | 0                 | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | 0                 | Learning         |

	## New section - Is it required or below example table is sufficient?
	#And only the following levy employers account will be debited
 #       | Collection Period         | Employer Levy account debited | Levy Payments | Transaction Type |
 #       | R01/Current Academic Year | employer 1                    | 1000          | Learning         |
 #       | R02/Current Academic Year | employer 1                    | 1000          | Learning         |
 #       | R03/Current Academic Year | employer 1                    | 1000          | Learning         |
Examples: 
        | Collection_Period         | Levy Balance for employer 1 | Levy Balance for employer 2 |
        | R01/Current Academic Year | 15500                       | 0                           |
        | R02/Current Academic Year | 14500                       | 0                           |
        | R03/Current Academic Year | 13500                       | 0                           |