#Scenario: A Non-DAS learner, learner finishes on time
#	Given the following commitments exist:
#        | ULN       | priority | start date | end date   | agreed price |
#        | learner a | 1        | 01/09/2018 | 08/09/2019 | 15000        |
#    When an ILR file is submitted with the following data:
#        | ULN       | agreed price | learner type           | start date | planned end date | actual end date | completion status |
#        | learner a | 15000        | programme only non-DAS | 01/09/2018 | 08/09/2019       | 08/09/2019      | completed         |
#    Then the provider earnings and payments break down as follows:
#        | Type                          | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 | 10/19 |
#        | Provider Earned Total         | 1000  | 1000  | 1000  | ... | 1000  | 3000  | 0     |
#        | Provider Earned from SFA      | 900   | 900   | 900   | ... | 900   | 2700  | 0     |
#        | Provider Earned from Employer | 100   | 100   | 100   | ... | 100   | 300   | 0     |
#        | Provider Paid by SFA          | 0     | 900   | 900   | ... | 900   | 900   | 2700  |
#        | Payment due from Employer     | 0     | 100   | 100   | ... | 100   | 100   | 300   |
#        | Levy account debited          | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy employer budget      | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy co-funding budget    | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget| 900   | 900   | 900   | ... | 900   | 2700  | 0     |

Scenario Outline:  One Non-levy learner finishes on time PV2-193
	Given the provider previously submitted the following learner details
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type |
		| learner a | 1        | Sep/Last Academic Year | 12 months        | 9000                 | 1st day of Sep/Last Academic Year   | 6000                   | 1st day of Sep/Last Academic Year     |                 | continuing        | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             |

    And the following earnings had been generated for the learner in the "Last Academic Year"
        | Delivery Period        | On-Programme | Completion | Balancing | Funding Line Type                                                     | SFA Contribution Percentage |
        | Aug/Last Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Sep/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Oct/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Nov/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Dec/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Jan/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Feb/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Mar/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Apr/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | May/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Jun/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | Jul/Last Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following provider payments had been generated in the "Last Academic Year"
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | Learning         |
        | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | Learning         |
        | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | Learning         |
        | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | Learning         |
        | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | Learning         |
        | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | Learning         |
        | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | Learning         |
        | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | Learning         |
        | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         | Learning         |
        | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | Learning         |
        | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | Learning         |

    But the Provider now changes the Learner details as follows
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type |
		| learner a | 1        | Sep/Last Academic Year | 12 months        | 9000                 | 1st day of Sep/Last Academic Year   | 6000                   | 1st day of Sep/Last Academic Year     | 12 months       | completed         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             |

	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period> in the "Current Academic Year"
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | Funding Line Type                                                     | SFA Contribution Percentage |
		| Aug/Current Academic Year | 1000         | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Sep/Current Academic Year | 0            | 3000       | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Oct/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Nov/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Dec/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Jan/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Feb/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Mar/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Apr/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| May/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Jun/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
		| Jul/Current Academic Year | 0            | 0          | 0         | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 0            | 3000       | 0         |
	And no payments will be calculated for following collection periods
		| Collection Period         |
		| R03/Current Academic Year |
		| R04/Current Academic Year |
		| R05/Current Academic Year |
		| R06/Current Academic Year |
		| R07/Current Academic Year |
		| R08/Current Academic Year |
		| R09/Current Academic Year |
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |
	And the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Completion       |
	And at month end the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Completion       |

Examples:
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |