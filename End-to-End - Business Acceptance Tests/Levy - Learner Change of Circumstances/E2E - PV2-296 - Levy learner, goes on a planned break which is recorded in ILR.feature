 #Scenario: Apprentice goes on a planned break midway through the learning episode and this is notified through the ILR
 #       Given the following commitments exist on 03/12/2018:
 #           | commitment Id | version Id | ULN       | start date | end date   | status | agreed price | effective from | effective to |
 #           | 1             | 1-001      | learner a | 01/09/2018 | 08/09/2019 | active | 15000        | 01/09/2018     | 31/10/2018   |
 #           | 1             | 1-002      | learner a | 01/09/2018 | 08/09/2019 | paused | 15000        | 01/11/2018     | 02/01/2019   |
 #           | 1             | 1-003      | learner a | 01/09/2018 | 08/09/2019 | active | 15000        | 03/01/2019     |              |
 #       When an ILR file is submitted on 03/12/2018 with the following data:
 #           | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
 #           | learner a | 01/09/2018 | 08/09/2019       | 31/10/2018      | planned break     | 12000                | 01/09/2018                          | 3000                   | 01/09/2018                            |
 #           | learner a | 03/01/2019 | 08/11/2019       |                 | continuing        | 12000                | 03/01/2019                          | 3000                   | 03/01/2019                            |
 #       Then the provider earnings and payments break down as follows:
 #           | Type                     | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... | 10/19 | 11/19 |
 #           | Provider Earned from SFA | 1000  | 1000  | 0     | 0     | 1000  | 1000  | ... | 1000  | 0     |
 #           | Provider Paid by SFA     | 0     | 1000  | 1000  | 0     | 0     | 1000  | ... | 1000  | 1000  |
 #           | Levy account debited     | 0     | 1000  | 1000  | 0     | 0     | 1000  | ... | 1000  | 1000  |
 #           | SFA Levy employer budget | 1000  | 1000  | 0     | 0     | 1000  | 1000  | ... | 1000  | 0     |

     Given  the employer levy account balance is 17000

	And The following commitments exist
		| commitment Id | version Id | ULN       | start date                | end date                     | status | agreed price |
		| 1             | 1          | learner a | 01/Sep/Last Academic Year | 30/Sep/Current Academic Year | Active | 15000        |
		| 1             | 2          | learner a | 01/Sep/Last Academic Year | 30/Sep/Current Academic Year | Paused | 15000        |
	 The provider previously submitted the following learner details
        | Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Funding Line Type                                  | SFA Contribution Percentage |
        | 1        | 01/Sep/Last Academic Year | 12 months        | 12000                | 01/Sep/Last Academic Year           | 3000                   | 01/Sep/Current Academic Year          | 2 months        | planned break     | Act1          | 1                   | ZPROG001      | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |

    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year | 0            | 0          | 0         |
        | Sep/Last Academic Year | 1000         | 0          | 0         |
        | Oct/Last Academic Year | 1000         | 0          | 0         |
        | Nov/Last Academic Year | 0            | 0          | 0         |
        | Dec/Last Academic Year | 0            | 0          | 0         |
        | Jan/Last Academic Year | 0            | 0          | 0         |
        | Feb/Last Academic Year | 0            | 0          | 0         |
        | Mar/Last Academic Year | 0            | 0          | 0         |
        | Apr/Last Academic Year | 0            | 0          | 0         |
        | May/Last Academic Year | 0            | 0          | 0         |
        | Jun/Last Academic Year | 0            | 0          | 0         |
        | Jul/Last Academic Year | 0            | 0          | 0         |

    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | Levy Payments  | Transaction Type |
        | R02/Last Academic Year | Sep/Last Academic Year | 1000           | Learning         |
        | R03/Last Academic Year | Oct/Last Academic Year | 1000           | Learning         |

    But The commitment is now changed as follows

	    | commitment Id | version Id | ULN       | start date                 | end date                     | status | agreed price |
        | 1             | 3          | learner a | 01/Sep/Last Academic Year  | 30/Sep/Current Academic Year | Active | 15000        |
	
	And the Provider now changes the Learner details as follows
		| Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code  | Programme Type | Funding Line Type                                   | SFA Contribution Percentage |
		| 1        | 03/Jan/Last Academic Year | 10 months        | 12000                | 03/Jan/Last Academic Year		   | 3000                   | 03/Jan/Last Academic Year             | continuing        | Act1          | 1                   | ZPROG001      | 55             | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract  | 90%                         |

	And price details as follows
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date |
        | 1st price details | 12000                | 01/Sep/Last Academic Year           | 3000                   | 01/Sep/Last Academic Year             |
        | 2nd price details | 12000                | 03/Jan/Last Academic Year           | 3000                   | 03/Jan/Last Academic Year             |

	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
        | Delivery Period        | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year | 0            | 0          | 0         |
        | Sep/Last Academic Year | 1000         | 0          | 0         |
        | Oct/Last Academic Year | 1000         | 0          | 0         |
        | Nov/Last Academic Year | 0            | 0          | 0         |
        | Dec/Last Academic Year | 0            | 0          | 0         |
        | Jan/Last Academic Year | 1000         | 0          | 0         |
        | Feb/Last Academic Year | 1000         | 0          | 0         |
        | Mar/Last Academic Year | 1000         | 0          | 0         |
        | Apr/Last Academic Year | 1000         | 0          | 0         |
        | May/Last Academic Year | 1000         | 0          | 0         |
        | Jun/Last Academic Year | 1000         | 0          | 0         |
        | Jul/Last Academic Year | 1000         | 0          | 0         |
    And at month end only the following payments will be calculated
        | Collection Period      | Delivery Period        | On-Programme | Completion | Balancing |
        | R06/Last Academic Year | Jan/Last Academic Year | 1000         | 0          | 0         |
        | R07/Last Academic Year | Feb/Last Academic Year | 1000         | 0          | 0         |
        | R08/Last Academic Year | Mar/Last Academic Year | 1000         | 0          | 0         |
        | R09/Last Academic Year | Apr/Last Academic Year | 1000         | 0          | 0         |
        | R10/Last Academic Year | May/Last Academic Year | 1000         | 0          | 0         |
        | R11/Last Academic Year | Jun/Last Academic Year | 1000         | 0          | 0         |
        | R12/Last Academic Year | Jul/Last Academic Year | 1000         | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period      | Delivery Period        | Levy Payments   | Transaction Type |
        | R06/Last Academic Year | Jan/Last Academic Year | 1000            | Learning         |
        | R07/Last Academic Year | Feb/Last Academic Year | 1000 			| Learning         |
        | R08/Last Academic Year | Mar/Last Academic Year | 1000 			| Learning         |
        | R09/Last Academic Year | Apr/Last Academic Year | 1000 			| Learning         |
        | R10/Last Academic Year | May/Last Academic Year | 1000 			| Learning         |
        | R11/Last Academic Year | Jun/Last Academic Year | 1000 			| Learning         |
        | R12/Last Academic Year | Jul/Last Academic Year | 1000 			| Learning         |
	And only the following provider payments will be generated
        | Collection Period      | Delivery Period        | Levy Payments   | Transaction Type |
        | R06/Last Academic Year | Jan/Last Academic Year | 1000            | Learning         |
        | R07/Last Academic Year | Feb/Last Academic Year | 1000 			| Learning         |
        | R08/Last Academic Year | Mar/Last Academic Year | 1000 			| Learning         |
        | R09/Last Academic Year | Apr/Last Academic Year | 1000 			| Learning         |
        | R10/Last Academic Year | May/Last Academic Year | 1000 			| Learning         |
        | R11/Last Academic Year | Jun/Last Academic Year | 1000 			| Learning         |
        | R12/Last Academic Year | Jul/Last Academic Year | 1000 			| Learning         |
Examples: 
        | Collection_Period      |
        | R04/Last Academic Year |
        | R05/Last Academic Year |
        | R06/Last Academic Year |
        | R07/Last Academic Year |
        | R08/Last Academic Year |
        | R09/Last Academic Year |
        | R10/Last Academic Year |
        | R11/Last Academic Year |
        | R12/Last Academic Year |