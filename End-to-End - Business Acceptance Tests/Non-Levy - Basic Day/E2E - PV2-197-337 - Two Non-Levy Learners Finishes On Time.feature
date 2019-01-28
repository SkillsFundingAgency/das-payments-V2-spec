  #  Scenario: 2 non-DAS learners, both finish on time
		#Given the following commitments exist:
  #          | ULN       | priority | start date | end date   | agreed price |
  #          | learner a | 1        | 01/09/2018 | 08/09/2019 | 15000        |
  #          | learner b | 1        | 01/09/2018 | 08/09/2019 | 12000        |
  #      When an ILR file is submitted with the following data:
  #          | ULN       | agreed price | learner type           | start date | planned end date | actual end date | completion status |
  #          | learner a | 15000        | programme only non-DAS | 01/09/2018 | 08/09/2019       | 08/09/2019      | completed         |
  #          | learner b | 12000        | programme only non-DAS | 01/09/2018 | 08/09/2019       | 08/09/2019      | completed         |
  #      Then the provider earnings and payments break down as follows for learner a:
  #          | Type                          | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 | 10/19 |
  #          | Provider Earned Total         | 1000  | 1000  | 1000  | ... | 1000  | 3000  | 0     |
  #          | Provider Earned from SFA      | 900   | 900   | 900   | ... | 900   | 2700  | 0     |
  #          | Provider Earned from Employer | 100   | 100   | 100   | ... | 100   | 300   | 0     |
  #          | Provider Paid by SFA          | 0     | 900   | 900   | ... | 900   | 900   | 2700  |
  #          | Payment due from Employer     | 0     | 100   | 100   | ... | 100   | 100   | 300   |
  #          | Levy account debited          | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA Levy employer budget      | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA Levy co-funding budget    | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA non-Levy co-funding budget| 900   | 900   | 900   | ... | 900   | 2700  | 0     |
  #      And then the provider earnings and payments break down as follows for learner b:
  #          | Type                          | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 | 10/19 |
  #          | Provider Earned Total         | 800   | 800   | 800   | ... | 800   | 2400  | 0     |
  #          | Provider Earned from SFA      | 720   | 720   | 720   | ... | 720   | 2160  | 0     |
  #          | Provider Earned from Employer | 80    | 80    | 80    | ... | 80    | 240   | 0     |
  #          | Provider Paid by SFA          | 0     | 720   | 720   | ... | 720   | 720   | 2160  |
  #          | Payment due from Employer     | 0     | 80    | 80    | ... | 80    | 80    | 240   |
  #          | Levy account debited          | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA Levy employer budget      | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA Levy co-funding budget    | 0     | 0     | 0     | ... | 0     | 0     | 0     |
  #          | SFA non-Levy co-funding budget| 720   | 720   | 720   | ... | 720   | 2160  | 0     |

Scenario Outline: Two Non-Levy Learners Finishes On Time PV2-337 (PV2-197)
	Given the provider previously submitted the following learner details
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
        | learner a | 1        | Sep/Last Academic Year | 12 months        | 15000                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                |                 | continuing        | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
        | learner b | 1        | Sep/Last Academic Year | 12 months        | 12000                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                |                 | continuing        | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |

    And the following earnings had been generated for the learner in the "Last Academic Year"
        | ULN       | Delivery Period        | On-Programme | Completion | Balancing |
        | learner a | Aug/Last Academic Year | 0            | 0          | 0         |
        | learner a | Sep/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Oct/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Nov/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Dec/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Jan/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Feb/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Mar/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Apr/Last Academic Year | 1000         | 0          | 0         |
        | learner a | May/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Jun/Last Academic Year | 1000         | 0          | 0         |
        | learner a | Jul/Last Academic Year | 1000         | 0          | 0         |
        | learner b | Aug/Last Academic Year | 0            | 0          | 0         |
        | learner b | Sep/Last Academic Year | 800          | 0          | 0         |
        | learner b | Oct/Last Academic Year | 800          | 0          | 0         |
        | learner b | Nov/Last Academic Year | 800          | 0          | 0         |
        | learner b | Dec/Last Academic Year | 800          | 0          | 0         |
        | learner b | Jan/Last Academic Year | 800          | 0          | 0         |
        | learner b | Feb/Last Academic Year | 800          | 0          | 0         |
        | learner b | Mar/Last Academic Year | 800          | 0          | 0         |
        | learner b | Apr/Last Academic Year | 800          | 0          | 0         |
        | learner b | May/Last Academic Year | 800          | 0          | 0         |
        | learner b | Jun/Last Academic Year | 800          | 0          | 0         |
        | learner b | Jul/Last Academic Year | 800          | 0          | 0         |
    And the following provider payments had been generated in the "Last Academic Year"
		| ULN       | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| learner a | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | Learning         |
		| learner a | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | Learning         |
		| learner b | R02/Last Academic Year | Sep/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R03/Last Academic Year | Oct/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R04/Last Academic Year | Nov/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R05/Last Academic Year | Dec/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R06/Last Academic Year | Jan/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R07/Last Academic Year | Feb/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R08/Last Academic Year | Mar/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R09/Last Academic Year | Apr/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R10/Last Academic Year | May/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R11/Last Academic Year | Jun/Last Academic Year | 720                    | 80                          | Learning         |
		| learner b | R12/Last Academic Year | Jul/Last Academic Year | 720                    | 80                          | Learning         |
    But the Provider now changes the Learner details as follows
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
        | learner a | 1        | Sep/Last Academic Year | 12 months        | 15000                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                | 12 months       | completed         | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
        | learner b | 1        | Sep/Last Academic Year | 12 months        | 12000                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                | 12 months       | completed         | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period> in the "Current Academic Year"
    Then the following learner earnings should be generated
		| ULN       | Delivery Period           | On-Programme | Completion | Balancing |
		| learner a | Aug/Current Academic Year | 1000         | 0          | 0         |
		| learner a | Sep/Current Academic Year | 0            | 3000       | 0         |
		| learner a | Oct/Current Academic Year | 0            | 0          | 0         |
		| learner a | Nov/Current Academic Year | 0            | 0          | 0         |
		| learner a | Dec/Current Academic Year | 0            | 0          | 0         |
		| learner a | Jan/Current Academic Year | 0            | 0          | 0         |
		| learner a | Feb/Current Academic Year | 0            | 0          | 0         |
		| learner a | Mar/Current Academic Year | 0            | 0          | 0         |
		| learner a | Apr/Current Academic Year | 0            | 0          | 0         |
		| learner a | May/Current Academic Year | 0            | 0          | 0         |
		| learner a | Jun/Current Academic Year | 0            | 0          | 0         |
		| learner a | Jul/Current Academic Year | 0            | 0          | 0         |
		| learner b | Aug/Current Academic Year | 800          | 0          | 0         |
		| learner b | Sep/Current Academic Year | 0            | 2400       | 0         |
		| learner b | Oct/Current Academic Year | 0            | 0          | 0         |
		| learner b | Nov/Current Academic Year | 0            | 0          | 0         |
		| learner b | Dec/Current Academic Year | 0            | 0          | 0         |
		| learner b | Jan/Current Academic Year | 0            | 0          | 0         |
		| learner b | Feb/Current Academic Year | 0            | 0          | 0         |
		| learner b | Mar/Current Academic Year | 0            | 0          | 0         |
		| learner b | Apr/Current Academic Year | 0            | 0          | 0         |
		| learner b | May/Current Academic Year | 0            | 0          | 0         |
		| learner b | Jun/Current Academic Year | 0            | 0          | 0         |
		| learner b | Jul/Current Academic Year | 0            | 0          | 0         |
	And only the following payments will be calculated
		| ULN       | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| learner a | R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| learner a | R02/Current Academic Year | Sep/Current Academic Year | 0            | 3000       | 0         |
		| learner b | R01/Current Academic Year | Aug/Current Academic Year | 800          | 0          | 0         |
		| learner b | R02/Current Academic Year | Sep/Current Academic Year | 0            | 2400       | 0         |
    And only the following provider payments will be recorded
		| ULN       | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| learner a | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| learner a | R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Completion       |
		| learner b | R01/Current Academic Year | Aug/Current Academic Year | 720                    | 80                          | Learning         |
		| learner b | R02/Current Academic Year | Sep/Current Academic Year | 2160                   | 240                         | Completion       |
	And at month end only the following provider payments will be generated
        | ULN       | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | learner a | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
        | learner a | R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Completion       |
        | learner b | R01/Current Academic Year | Aug/Current Academic Year | 720                    | 80                          | Learning         |
        | learner b | R02/Current Academic Year | Sep/Current Academic Year | 2160                   | 240                         | Completion       |
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