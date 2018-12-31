#Scenario:Payment for a non-DAS learner, requires learning support, doing an apprenticeship standard
#    
#	
#	When an ILR file is submitted with the following data:
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | standard code | learning support code | learning support date from | learning support date to |
#        | learner a | programme only non-DAS | 15000        | 06/08/2018 | 08/08/2018       | 10/08/2019      | completed         | 50            | 1                     | 06/08/2018                 | 10/08/2019               |
#    
#	Then the provider earnings and payments break down as follows:
#	
#        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total                   | 1150  | 1150  | 1150  | 1150  | 1150  | ... | 1150  | 3000  | 0     |
#        | Provider Earned from SFA                | 1050  | 1050  | 1050  | 1050  | 1050  | ... | 1050  | 2700  | 0     |
#        | Provider Earned from Employer           | 100   | 100   | 100   | 100   | 100   | ... | 100   | 300   | 0     |
#        | Provider Paid by SFA                    | 0     | 1050  | 1050  | 1050  | 1050  | ... | 1050  | 1050  | 2700  |
#        | Payment due from Employer               | 0     | 100   | 100   | 100   | 100   | ... | 100   | 100   | 300   |
#        | Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget          | 900   | 900   | 900   | 900   | 900   | ... | 900   | 2700  | 0     |
#        | SFA non-Levy additional payments budget | 150   | 150   | 150   | 150   | 150   | ... | 150   | 0     | 0     |
#    
#	
#	And the transaction types for the payments are:
#	
#        | Payment type                 | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
#        | On-program                   | 0     | 900   | 900   | 900   | 900   | ... | 900   | 900   | 0     |
#        | Completion                   | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 2700  |
#        | Balancing                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Provider 16-18 incentive     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Provider learning support    | 0     | 150   | 150   | 150   | 150   | ... | 150   | 150   | 0     |

# Notes - changed the months from aug to Sep so on program and learning support payments can be generated via system

Scenario Outline: Non-levy learner - learning support, OPP and completion payments PV2-429
 # For DC integration
 # learning support code | learning support date from | learning support date to     |
 # 1                     | 06/Sep/Last Academic Year  | 10/Sep/Current Academic Year |
	Given the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Sep/Last Academic Year | 12 months        | 15000                | 06/Sep/Last Academic Year           | 0                      | 06/Sep/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | LearningSupport |
        | Aug/Last Academic Year | 0            | 0          | 0         | 0               |
        | Sep/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Oct/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Nov/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Dec/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Jan/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Feb/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Mar/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Apr/Last Academic Year | 1000         | 0          | 0         | 150             |
        | May/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Jun/Last Academic Year | 1000         | 0          | 0         | 150             |
        | Jul/Last Academic Year | 1000         | 0          | 0         | 150             |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
        | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | 0                         | Learning         |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R06/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R07/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R08/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R09/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R10/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R11/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
        | R12/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Sep/Last Academic Year | 12 months        | 15000                | 06/Sep/Last Academic Year           | 0                      | 06/Sep/Last Academic Year             | 12 months       | completed         | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | LearningSupport |
		| Aug/Current Academic Year | 1000         | 0          | 0         | 150             |
		| Sep/Current Academic Year | 0            | 3000       | 0         | 0               |
		| Oct/Current Academic Year | 0            | 0          | 0         | 0               |
		| Nov/Current Academic Year | 0            | 0          | 0         | 0               |
		| Dec/Current Academic Year | 0            | 0          | 0         | 0               |
		| Jan/Current Academic Year | 0            | 0          | 0         | 0               |
		| Feb/Current Academic Year | 0            | 0          | 0         | 0               |
		| Mar/Current Academic Year | 0            | 0          | 0         | 0               |
		| Apr/Current Academic Year | 0            | 0          | 0         | 0               |
		| May/Current Academic Year | 0            | 0          | 0         | 0               |
		| Jun/Current Academic Year | 0            | 0          | 0         | 0               |
		| Jul/Current Academic Year | 0            | 0          | 0         | 0               |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | LearningSupport |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         | 150             |
		| R02/Current Academic Year | Sep/Current Academic Year | 0            | 3000       | 0         | 0               |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | 0                         | Learning         |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | 0                         | Completion       |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | 0                         | Learning         |
		| R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 150                       | LearningSupport  |
		| R02/Current Academic Year | Sep/Current Academic Year | 2700                   | 300                         | 0                         | Completion       |
	Examples:
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |