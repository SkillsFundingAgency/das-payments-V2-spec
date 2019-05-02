#Feature: 5% Contribution from April 2019
#
#Scenario: Non Levy Learner, started learning before Apr19, completes learning and starts new course on new pathway code from Apr19, second pathway code on 5% contribution
#
#Background: The example is demonstrating a learner flagged as 'Non Levy' ACT2 starts learning pre Apr 2019 completes learning, starts new course on new pathway code in Apr19
#			and moves to 5% contribution for second pathway code as its new learning from Apr19
#	
#    Given The learner is programme only Non Levy 
#	And the apprenticeship funding band maximum is 15000
#	
#	When an ILR file is submitted with the following data:
#        | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | framework code | programme type | pathway code |
#        | learner a | 03/04/2018 | 01/04/2019       | 01/04/2019      | completes         | 12000                | 03/04/2018                          | 3000                   | 03/04/2018                            | 403            | 2              | 1            |
#        | learner a | 02/04/2019 | 01/04/2020       |                 | continuing        | 12000                | 02/04/2019                          | 3000                   | 02/04/2019                            | 403            | 2              | 2            |
#       		
#	Then the provider earnings and payments break down as follows:
#		
#        | Type                       		| 04/18 | 05/18 | 06/18 | ... | 03/19 | 04/19 | 05/19 | 06/19 | ... | 03/20 | 04/20 |
#        | Provider Earned Total      		| 1000  | 1000  | 1000  | ... | 1000  | 4000  | 1000  | 1000  | ... | 1000  | 0     |
#        | Provider Earned from SFA   		| 900   | 900   | 900   | ... | 900   | 3650  | 950   | 950   | ... | 950   | 0     |
#        | Provider Earned from Employer 	| 100   | 100   | 100   | ... | 100   | 350   | 50    | 50    | ... | 50    | 0     |            
#		| Provider Paid by SFA       		| 0     | 900   | 900   | ... | 900   | 900   | 3650  | 950   | ... | 950   | 950   |
#        | Payment due from Employer         | 0     | 100   | 100   | ... | 100   | 100   | 350   | 50    | ... | 50    | 50    | 
#		| Levy account debited       		| 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | SFA Levy employer budget   		| 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | SFA Levy co-funding budget 		| 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		| SFA non-Levy co-funding budget	| 900   | 900   | 900   | ... | 900   | 3650  | 950   | 950   | ... | 950   | 0     | 
#
#	And the transaction types for the payments are:
#        | Payment type                 | 05/18 | 06/18 | ... | 03/19 | 04/19 | 05/19 | 06/19 | ... | 03/20 | 04/20 |
#        | On-program                   | 900   | 900   | ... | 900   | 900   | 950   | 950   | ... | 950   | 950   |
#        | Completion                   | 0     | 0     | ... | 0     | 0     | 2700  | 0     | ... | 0     | 0     |
#        | Balancing                    | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Provider 16-18 incentive     | 0     | 0     | ... | 0     | 0     | 0     | 0     | ... | 0     | 0     |	
#
##April 2019 contains completion payment of £2700 at 10% contribution from first learning, and £950 on program earnings from second learning at 5% contribution		

Feature: 5% Contribution from April 2019 - PV2-902
	As a provider,
	I want a Non Levy learner, starting prior to Apr 2019, where learner completes learning and starts a new course on new Pathway code in Apr 2019 on 10% contribution
	So that I am paid the correct apprenticeship funding by SFA	

Scenario Outline: Existing Non Levy Learner, started learning before Apr19, completes learning and starts new course on new pathway code from Apr19, second pathway code on 5% contribution

	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 01/Apr/Last Academic Year | 12 months        | 15000                | 01/Apr/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |

    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year    | 0            | 0          | 0         |
        | Sep/Last Academic Year    | 0            | 0          | 0         |
        | Oct/Last Academic Year    | 0            | 0          | 0         |
        | Nov/Last Academic Year    | 0            | 0          | 0         |
        | Dec/Last Academic Year    | 0            | 0          | 0         |
        | Jan/Last Academic Year    | 0            | 0          | 0         |
        | Feb/Last Academic Year    | 0            | 0          | 0         |
        | Mar/Last Academic Year    | 0            | 0          | 0         |
        | Apr/Last Academic Year    | 1000         | 0          | 0         |
        | May/Last Academic Year    | 1000         | 0          | 0         |
        | Jun/Last Academic Year    | 1000         | 0          | 0         |
        | Jul/Last Academic Year    | 1000         | 0          | 0         |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 1000         | 0          | 0         |
		| Dec/Current Academic Year | 1000         | 0          | 0         |
		| Jan/Current Academic Year | 1000         | 0          | 0         |
		| Feb/Current Academic Year | 1000         | 0          | 0         |
		| Mar/Current Academic Year | 1000         | 3000       | 0         |
		| Apr/Current Academic Year | 0            | 0          | 0         |
		| May/Current Academic Year | 0            | 0          | 0         |
		| Jun/Current Academic Year | 0            | 0          | 0         |
		| Jul/Current Academic Year | 0            | 0          | 0         |

    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R09/Last Academic Year    | Apr/Last Academic Year    | 900                    | 100                         | Learning         |
        | R10/Last Academic Year    | May/Last Academic Year    | 900                    | 100                         | Learning         |
        | R11/Last Academic Year    | Jun/Last Academic Year    | 900                    | 100                         | Learning         |
        | R12/Last Academic Year    | Jul/Last Academic Year    | 900                    | 100                         | Learning         |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
        | R01/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 2700                   | 300                         | Completion       |
     
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 01/Apr/Last Academic Year    | 12 months        | 15000                | 01/Apr/Last Academic Year           |                        |                                       | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| 01/Apr/Current Academic Year | 12 months        | 15000                | 01/Apr/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 2            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 95%                         |

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
		| Apr/Current Academic Year | 1000         | 0          | 0         |
		| May/Current Academic Year | 1000         | 0          | 0         |
		| Jun/Current Academic Year | 1000         | 0          | 0         |
		| Jul/Current Academic Year | 1000         | 0          | 0         |

    And at month end only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | LearningSupport |
		| R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         | 0               |
		| R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         | 0               |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R09/Current Academic Year | Apr/Current Academic Year | 950                    | 50                          | 0                         | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 950                    | 50                          | 0                         | Learning         |  
	And  only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R09/Current Academic Year | Apr/Current Academic Year | 950                    | 50                          | 0                         | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 950                    | 50                          | 0                         | Learning         |
	Examples:
        | Collection_Period         |
        | R09/Current Academic Year |
        | R10/Current Academic Year |