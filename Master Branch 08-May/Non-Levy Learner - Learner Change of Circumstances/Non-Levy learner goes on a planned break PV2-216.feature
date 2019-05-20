@ignore
Feature: Non-levy learner, goes on a planned break which is recorded in ILR PV2-216
	As a provider,
	I want a non-levy learner, goes on a planned break which is recorded in ILR, to be paid the correct amount
	So that I am accurately paid my apprenticeship provision.

Scenario Outline: Non-levy learner goes on a planned break which is recorded in ILR PV2-216
    Given the provider previously submitted the following learner details
        | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | SFA Contribution Percentage |
        | 01/Sep/Current Academic Year | 12 months        | 15000                | 01/Sep/Current Academic Year        |                        |                                       | 2 months        | planned break     | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 0            | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | SFA Contribution Percentage |
		| 03/Jan/Current Academic Year | 10 months        | 15000                | 03/Jan/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | 90%                         |
	And price details as follows
        | Price Episode Id | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | SFA Contribution Percentage |
        | pe-1             | 15000                | 01/Sep/Current Academic Year        |                        |                                       | 90%                         |
        | pe-2             | 15000                | 03/Jan/Current Academic Year        |                        |                                       | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | Price Episode Identifier |
        | Aug/Current Academic Year | 0            | 0          | 0         | pe-1                     |
        | Sep/Current Academic Year | 1000         | 0          | 0         | pe-1                     |
        | Oct/Current Academic Year | 1000         | 0          | 0         | pe-1                     |
        | Nov/Current Academic Year | 0            | 0          | 0         | pe-1                     |
        | Dec/Current Academic Year | 0            | 0          | 0         | pe-1                     |
        | Jan/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | Feb/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | Mar/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | Apr/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | May/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | Jun/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
        | Jul/Current Academic Year | 1000         | 0          | 0         | pe-2                     |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         |
        | R07/Current Academic Year | Feb/Current Academic Year | 1000         | 0          | 0         |
        | R08/Current Academic Year | Mar/Current Academic Year | 1000         | 0          | 0         |
        | R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         |
        | R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         |
        | R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         |
        | R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         |
Examples: 
        | Collection_Period         |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |

#Scenario: Non-Levy learner, goes on a planned break which is recorded in the ILR
#		
#		Given the learner is programme only non-das
#        and the apprenticeship funding band maximum is 17000
#      
#		
#		When an ilr file is submitted on 03/12/2018 with the following data:
#            | uln       | start date | planned end date | actual end date | completion status | total training price | total training price effective date | total assessment price | total assessment price effective date |
#            | learner a | 01/09/2018 | 08/09/2019       | 31/10/2018      | planned break     | 12000                | 01/09/2018                          | 3000                   | 01/09/2018                            |
#            | learner a | 03/01/2019 | 08/11/2019       |                 | continuing        | 12000                | 03/01/2019                          | 3000                   | 03/01/2019                            |
#        
#		
#		Then the provider earnings and payments break down as follows:
#		
#            | type                           | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... | 10/19 | 11/19 |
#            | provider earned total          | 1000  | 1000  | 0     | 0     | 1000  | 1000  | ... | 1000  | 0     |
#            | provider earned from sfa       | 900   | 900   | 0     | 0     | 900   | 900   | ... | 900   | 0     |
#            | provider earned from employer  | 100   | 100   | 0     | 0     | 100   | 100   | ... | 100   | 0     |
#            | provider paid by sfa           | 0     | 900   | 900   | 0     | 0     | 900   | ... | 900   | 900   |
#            | payment due from employer      | 0     | 100   | 100   | 0     | 0     | 100   | ... | 100   | 100   |
#            | levy account debited           | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#            | sfa levy employer budget       | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#            | sfa levy co-funding budget     | 0     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#            | sfa non-levy co-funding budget | 900   | 900   | 0     | 0     | 900   | 900   | ... | 900   | 0     |
