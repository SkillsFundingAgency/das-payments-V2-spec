#Scenario: Payment for a non-DAS learner, lives in a disadvantaged postocde area - 1-10% most deprived,undertaking apprenticeship standard -Disadvantage Uplift is not paid
#    Given A Non-Das Learner 
#    And the apprenticeship funding band maximum is 15000
#    When an ILR file is submitted with the following data:
#        | ULN       | learner type             | agreed price | start date | planned end date | actual end date | completion status | standard code | home postcode deprivation |
#        | learner a | programme only non-DAS   | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | 50            | 1-10%                     |
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total                   | 1000  | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     | 0     |
#		| Provider Earned from SFA                | 900   | 900   | 900   | 900	  | 900   | ... | 900   | 0		| 0     |        
#	    | Provider Earned from Employer           | 100   | 100   | 100   | 100   | 100   | ... | 100   | 0     | 0     |
#        | Provider Paid by SFA                    | 0     | 900   | 900   | 900   | 900   | ... | 900   | 900   | 0     |
#        | Payment due from Employer               | 0     | 100   | 100   | 100   | 100   | ... | 100   | 100   | 0     |
#        | Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget          | 900   | 900   | 900   | 900   | 900   | ... | 900   | 0     | 0     |
#        | SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy additional payments budget     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#    And the transaction types for the payments are:
#        | Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
#        | On-program                   | 900   | 900   | 900   | 900   | ... | 900   | 0     |
#        | Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | ... | 0     | 0     |

Scenario Outline:Non-levy learner - on standard , Disadvantage Uplift 1-10% not paid
	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Sep/Last Academic Year | 12 months        | 12000                | 06/Aug/Last Academic Year           | 3000                   | 06/Aug/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 50            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year | 1000         | 0          | 0         |
        | Sep/Last Academic Year | 1000         | 0          | 0         |
        | Oct/Last Academic Year | 1000         | 0          | 0         |
        | Nov/Last Academic Year | 1000         | 0          | 0         |
        | Dec/Last Academic Year | 1000         | 0          | 0         |
        | Jan/Last Academic Year | 1000         | 0          | 0         |
        | Feb/Last Academic Year | 1000         | 0          | 0         |
        | Mar/Last Academic Year | 1000         | 0          | 0         |
        | Apr/Last Academic Year | 1000         | 0          | 0         |
        | May/Last Academic Year | 1000         | 0          | 0         |
        | Jun/Last Academic Year | 1000         | 0          | 0         |
        | Jul/Last Academic Year | 1000         | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type    |
        | R01/Last Academic Year | Aug/Last Academic Year | 900                    | 100                         | Learning            |
        | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | Learning            |
        | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | Learning            |
        | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | Learning            |
        | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | Learning            |
        | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | Learning            |
        | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | Learning            |
        | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | Learning            |
        | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | Learning            |
        | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         | Learning            |
        | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | Learning            |
        | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | Learning            |

    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Aug/Last Academic Year | 12 months        | 12000                | 06/Aug/Last Academic Year           | 3000                   | 06/Aug/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 50            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 1000         | 0          | 0         |
		| Sep/Current Academic Year | 0            | 3000       | 0         |

    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 0            | 3000       | 0         |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |Transaction Type    |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         |Learning            |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         |Completion          |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |Transaction Type    |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         |Learning            |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         |Completion          |      
	Examples:
        | Collection_Period         |
		| R01/Current Academic Year |
		| R02/Current Academic Year |