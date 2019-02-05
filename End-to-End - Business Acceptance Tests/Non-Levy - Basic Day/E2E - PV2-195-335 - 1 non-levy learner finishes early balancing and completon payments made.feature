#Feature: Provider earnings and payments where learner completes earlier than planned
#
#    The earnings and payment rules for early completions are the same as for learners finishing on time, except that the completion payment is earned earlier.
#
#    Background:
#        Given the apprenticeship funding band maximum for each learner is 20000
#        
#        Scenario: A non-DAS learner, learner finishes early
#        When an ILR file is submitted with the following data:
#            | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status |
#            | learner a | programme only non-DAS | 18750        | 01/09/2018 | 08/12/2019       | 08/09/2019      | completed         |
#        Then the provider earnings and payments break down as follows:
#            | Type                           | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 | 10/19 |
#            | Provider Earned Total          | 1000  | 1000  | 1000  | ... | 1000  | 6750  | 0     |
#            | Provider Earned from SFA       | 900   | 900   | 900   | ... | 900   | 6075  | 0     |
#            | Provider Earned from Employer  | 100   | 100   | 100   | ... | 100   | 675   | 0     |
#            | Provider Paid by SFA           | 0     | 900   | 900   | ... | 900   | 900   | 6075  |
#            | Payment due from Employer      | 0     | 100   | 100   | ... | 100   | 100   | 675   |
#            | Levy account debited           | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#            | SFA Levy employer budget       | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#            | SFA Levy co-funding budget     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#            | SFA non-Levy co-funding budget | 900   | 900   | 900   | ... | 900   | 6075  | 0     |
#        And the transaction types for the payments are:
#            | Payment type             | 10/18 | 11/18 | 12/18 | 01/19 | ... | 09/19 | 10/19 |
#            | On-program               | 900   | 900   | 900   | 900   | ... | 900   | 0     |
#            | Completion               | 0     | 0     | 0     | 0     | ... | 0     | 3375  |
#            | Balancing                | 0     | 0     | 0     | 0     | ... | 0     | 2700  |
#            | Employer 16-18 incentive | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#            | Provider 16-18 incentive | 0     | 0     | 0     | 0     | ... | 0     | 0     |

Feature: One Non-Levy Learner finishes early, Balancing and Completion payments made PV2-335 (PV2-195)

@EndToEnd

Scenario Outline: 1 non-levy learner finishes early balancing and completon payments made
	Given the provider previously submitted the following learner details
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| learner a | 1        | Sep/Last Academic Year | 15 months        | 18750                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                |                 | continuing        | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
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
    And the following provider payments had been generated
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
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type        | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| learner a | 1        | Sep/Last Academic Year | 15 months        | 18750                | Sep/Last Academic Year              | 0                      | Sep/Last Academic Year                | 12 months       | completed         | ContractWithEmployer | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period R03/Current Academic Year
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | 
		| Aug/Current Academic Year | 1000         | 0          | 0         | 
		| Sep/Current Academic Year | 0            | 3750       | 3000      | 
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
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 0            | 3750       | 3000      |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 3375                   | 375                         | Completion       |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Balancing        |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
		| R02/Current Academic Year | Sep/Current Academic Year | 3375                   | 375                         | Completion       |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | Balancing        |
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