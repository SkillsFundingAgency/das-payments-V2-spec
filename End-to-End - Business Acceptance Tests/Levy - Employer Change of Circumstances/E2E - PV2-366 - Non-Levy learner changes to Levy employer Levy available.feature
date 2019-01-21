 Scenario: Apprentice changes from a non-levy to levy employer, levy is available for the levy employer
        Given The learner is programme only DAS
        And the employer 2 has a levy balance > agreed price for all months
        And the learner changes employers
            | Employer   | Type    | ILR employment start date |
            | employer 1 | Non DAS | 06/08/2018                |
            | employer 2 | DAS     | 01/04/2019                |
        
        And the following commitments exist on 03/04/2018:
            | Employer   | commitment Id | version Id | ULN       | start date | end date   | agreed price | status    | effective from | effective to |
            | employer 2 | 1             | 1-001      | learner a | 01/04/2019 | 01/08/2019 | 3500         | active    | 01/04/2019     |              |
        
        When an ILR file is submitted with the following data:
            | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | Residual training price | Residual training price effective date | Residual assessment price | Residual assessment price effective date |
            | learner a | 06/08/2018 | 08/08/2019       |                 | continuing        | 5000                 | 06/08/2018                          | 1000                   | 06/08/2018                            | 2500                    | 01/04/2019                             | 1000                      | 01/04/2019                               |
        
        And the Contract type in the ILR is:
            | contract type | date from  | date to    |
            | Non-DAS       | 06/08/2018 | 31/03/2019 |
            | DAS           | 01/04/2019 | 08/08/2019 |
        
        #Then the data lock status will be as follows:
        #    | Payment type | 08/18 | 09/18 | 10/18 | ... | 03/19 | 04/19               | 05/19               | 06/19               | 07/19               | 
        #    | On-program   |       |       |       | ... |       | commitment 1 v1-001 | commitment 1 v1-001 | commitment 1 v1-001 | commitment 1 v1-001 | 
        
        Then the provider earnings and payments break down as follows:
            | Type                            | 08/18 | 09/18 | 10/18 | ... | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 | 08/19 |
            | Provider Earned Total           | 400   | 400   | 400   | ... | 400   | 700   | 700   | 700   | 700   | 0     |
            | Provider Earned from SFA        | 360   | 360   | 360   | ... | 360   | 700   | 700   | 700   | 700   | 0     |
            | Provider Earned from Employer 1 | 40    | 40    | 40    | ... | 40    | 0     | 0     | 0     | 0     | 0     |
            | Provider Earned from Employer 2 | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
            | Provider Paid by SFA            | 0     | 360   | 360   | ... | 360   | 360   | 700   | 700   | 700   | 700   |
            | Payment due from employer 1     | 0     | 40    | 40    | ... | 40    | 40    | 0     | 0     | 0     | 0     |
            | Payment due from employer 2     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
            | Employer 2 Levy account debited | 0     | 0     | 0     | ... | 0     | 0     | 700   | 700   | 700   | 700   |
            | SFA Levy employer budget        | 0     | 0     | 0     | ... | 0     | 700   | 700   | 700   | 700   | 0     |
            | SFA Levy co-funding budget      | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
            | SFA non-Levy co-funding budget  | 360   | 360   | 360   | ... | 360   | 0     | 0     | 0     | 0     | 0     |


# For DC integration
    #    And the learner changes employers
        #| Employer   | Type    | ILR employment start date |
        #| employer 1 | Non DAS | 06/08/2018                |
        #| employer 2 | DAS     | 01/04/2019                |

Scenario Outline: Learner changes from a non-levy to levy employer, levy is available for the levy employer PV2-366
	# levy balance
	Given the "employer 2" levy account balance in collection period <Collection_Period> is <Levy Balance for employer 2>
	# Date added in the end
	And the following commitments exist on "03/Apr/Current Academic Year"
	# Additional fields
        | Employer   | commitment Id | version Id | ULN       | start date | end date   | agreed price | status    | effective from | effective to |
        | employer 2 | 1             | 1-001      | learner a | 01/04/2019 | 01/08/2019 | 3500         | active    | 01/04/2019     |              |

	And the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                      | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 5000                 | 06/Aug/Current Academic Year        | 1000                   | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 400          | 0          | 0         |
		| Sep/Current Academic Year | 400          | 0          | 0         |
		| Oct/Current Academic Year | 400          | 0          | 0         |
		| Nov/Current Academic Year | 400          | 0          | 0         |
		| Dec/Current Academic Year | 400          | 0          | 0         |
		| Jan/Current Academic Year | 400          | 0          | 0         |
		| Feb/Current Academic Year | 400          | 0          | 0         |
		| Mar/Current Academic Year | 400          | 0          | 0         |
		| Apr/Current Academic Year | 400          | 0          | 0         |
		| May/Current Academic Year | 400          | 0          | 0         |
		| Jun/Current Academic Year | 400          | 0          | 0         |
		| Jul/Current Academic Year | 400          | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 360                    | 40                          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 360                    | 40                          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 360                    | 40                          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 360                    | 40                          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 360                    | 40                          | Learning         |
		| R06/Current Academic Year | Jan/Current Academic Year | 360                    | 40                          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 360                    | 40                          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 360                    | 40                          | Learning         |

    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 5000                 | 06/Aug/Current Academic Year        | 1000                   | 06/Aug/Current Academic Year          |                 | continuing        | Act           | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	And price details as follows
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date |
        | 1st price details | 5000                 | 06/Aug/Current Academic Year        | 1000                   | 06/Aug/Current Academic Year          | 0                       |                                        | 0                         |                                          |
        | 2nd price details | 5000                 | 06/Aug/Current Academic Year        | 1000                   | 06/Aug/Current Academic Year          | 2500                    | 01/Apr/Current Academic Year           | 1000                      | 01/Apr/Current Academic Year             |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 400          | 0          | 0         |
		| Sep/Current Academic Year | 400          | 0          | 0         |
		| Oct/Current Academic Year | 400          | 0          | 0         |
		| Nov/Current Academic Year | 400          | 0          | 0         |
		| Dec/Current Academic Year | 400          | 0          | 0         |
		| Jan/Current Academic Year | 400          | 0          | 0         |
		| Feb/Current Academic Year | 400          | 0          | 0         |
		| Mar/Current Academic Year | 400          | 0          | 0         |
		| Apr/Current Academic Year | 700          | 0          | 0         |
		| May/Current Academic Year | 700          | 0          | 0         |
		| Jun/Current Academic Year | 700          | 0          | 0         |
		| Jul/Current Academic Year | 700          | 0          | 0         |
    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R09/Current Academic Year | Apr/Current Academic Year | 700          | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 700          | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 700          | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 700          | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R09/Current Academic Year | Apr/Current Academic Year | 700           | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 700           | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 700           | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 700           | Learning         |
	And only the following provider payments will be generated
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R09/Current Academic Year | Apr/Current Academic Year | 700           | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 700           | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 700           | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 700           | Learning         |
Examples: 
        | Collection_Period         | Levy Balance for employer 2 |
		| R09/Current Academic Year | 3300                        |
		| R10/Current Academic Year | 2600                        |
		| R11/Current Academic Year | 1900                        |
		| R12/Current Academic Year | 1200                        |