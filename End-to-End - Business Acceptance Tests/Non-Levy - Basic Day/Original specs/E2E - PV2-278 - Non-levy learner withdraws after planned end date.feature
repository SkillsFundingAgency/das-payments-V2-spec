 #Scenario: A non-DAS learner, learner withdraws after planned end date 
 #   
 #       When an ILR file is submitted with the following data:
 #           | ULN       | agreed price | learner type           | start date | planned end date | actual end date | completion status |
 #           | learner a | 15000        | programme only non-DAS | 01/09/2017 | 08/09/2018       | 08/12/2018      | withdrawn         |
 #           
 #       Then the provider earnings and payments break down as follows:
 #           | Type                          | 09/17 | 10/17 | 11/17 | ... | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 |
 #           | Provider Earned Total         | 1000  | 1000  | 1000  | ... | 1000  | 0     | 0     | 0     | 0     | 0     |
 #           | Provider Earned from SFA      | 900   | 900   | 900   | ... | 900   | 0     | 0     | 0     | 0     | 0     |
 #           | Provider Earned from Employer | 100   | 100   | 100   | ... | 100   | 0     | 0     | 0     | 0     | 0     |
 #           | Provider Paid by SFA          | 0     | 900   | 900   | ... | 900   | 900   | 0     | 0     | 0     | 0     |
 #           | Payment due from Employer     | 0     | 100   | 100   | ... | 100   | 100   | 0     | 0     | 0     | 0     |
 #           | Levy account debited          | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
 #           | SFA Levy employer budget      | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
 #           | SFA Levy co-funding budget    | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
 #           | SFA non-Levy co-funding budget| 900   | 900   | 900   | ... | 900   | 0     | 0     | 0     | 0     | 0     |
 #  
 #       And the transaction types for the payments are:
 #           | Payment type             | 10/17 | 11/17 | 12/17 | 01/18 | ... | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 |
 #           | On-program               | 900   | 900   | 900   | 900   | ... | 900   | 0     | 0     | 0     | 0     |
 #           | Completion               | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     |
 #           | Balancing                | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     |
 #           | Employer 16-18 incentive | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     |
 #           | Provider 16-18 incentive | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     |

Scenario: A non-levy learner withdraws after planned end date PV2-278
    Given the provider previously submitted the following learner details in the "Last Academic Year"
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
		| learner a | 1        | Sep/Last Academic Year | 12 months        | 12000                | Sep/Last Academic Year              | 3000                   | Sep/Last Academic Year                |                 | continuing        | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
    And the following earnings had been generated for the learner in the "Last Academic Year"
        | Delivery Period        | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year | 0            | 0          | 0         |
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
    And the following provider payments had been generated in the "Last Academic Year"
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments |
        | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         |
        | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         |
        | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         |
        | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         |
        | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         |
        | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         |
        | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         |
        | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         |
        | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         |
        | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         |
        | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         |
    And the provider previously submitted the following learner details in the "Current Academic Year"
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
		| learner a | 1        | Sep/Last Academic Year | 12 months        | 12000                | Sep/Last Academic Year              | 3000                   | Sep/Last Academic Year                |                 | continuing        | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
    And the following earnings had been generated for the learner in the "Current Academic Year"
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 900        | 900       |
        | Sep/Current Academic Year | 0            | 0          | 0         |
        | Oct/Current Academic Year | 0            | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |
    And the following provider payments had been generated in the "Current Academic Year"
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         |
    But the Provider now changes the Learner details as follows in the "Current Academic Year"
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     |
		| learner a | 1        | Sep/Last Academic Year | 15 months        | 12000                | Sep/Last Academic Year              | 3000                   | Sep/Last Academic Year                | 15 months       | withdrawn         | 90%                         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) |
    When the amended ILR file is re-submitted for the learners in collection period "R05/Current Academic Year"
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 900        | 100       |
        | Sep/Current Academic Year | 0            | 0          | 0         |
        | Oct/Current Academic Year | 0            | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |
    And no payments will be calculated
	And no provider payments will be recorded
	And at month end no provider payments will be generated