#Scenario: Payment for a DAS learner,does not live in a disadvantaged postcode area, undertaking apprenticeship standard - Disadvantage Uplift is not paid
#    Given levy balance > agreed price for all months
#    And the following commitments exist:
#        | commitment Id | version Id | ULN       | start date | end date   | standard code | agreed price | status |
#        | 1             | 1          | learner a | 01/08/2018 | 01/08/2019 | 50            | 15000        | active |
#    When an ILR file is submitted with the following data:
#        | ULN       | learner type       | agreed price | start date | planned end date | actual end date | completion status | standard code | home postcode deprivation |
#        | learner a | programme only DAS | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | 50            | not deprived              |
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
#        | Provider Earned Total                   | 1000  | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     | 0     |
#        | Provider Paid by SFA                    | 0     | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 1000  | 0     |
#        | Payment due from Employer               | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | Levy account debited                    | 0     | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 1000  | 0     |
#        | SFA Levy employer budget                | 1000  | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#        | SFA Levy additional payments budget     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
#    And the transaction types for the payments are:
#        | Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
#        | On-program                   | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
#        | Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | ... | 0     | 0     |

Feature: Payment for a DAS learner,does not live in a disadvantaged postcode area, undertaking apprenticeship standard - Disadvantage Uplift is not paid
		As a provider,
		I want a non-levy learner who does not live in a Disadvantaged Postcode area to undertake an Apprenticeship Standard course
		So that I am not paid the Disadvantage Uplift payment.

Scenario Outline: Levy learner, on standard, Disadvantage Uplift not paid PV2-450
	Given the employer levy account balance in collection period <Collection_Period> is <Levy Balance>
	And the following commitments exist
		| start date                   | end date                  | agreed price | standard code | status |
		| 01/Aug/Current Academic Year | 01/Aug/Next Academic Year | 15000        | 50            | active |
    And the provider is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 14000                | 06/Aug/Current Academic Year        | 1000                   | 06/Aug/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 50            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	When the ILR file is submitted for the learners for collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 1000         | 0          | 0         |
        | Dec/Current Academic Year | 1000         | 0          | 0         |
        | Jan/Current Academic Year | 1000         | 0          | 0         |
        | Feb/Current Academic Year | 1000         | 0          | 0         |
        | Mar/Current Academic Year | 1000         | 0          | 0         |
        | Apr/Current Academic Year | 1000         | 0          | 0         |
        | May/Current Academic Year | 1000         | 0          | 0         |
        | Jun/Current Academic Year | 1000         | 0          | 0         |
        | Jul/Current Academic Year | 1000         | 0          | 0         |
    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
        | R04/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1000         | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 1000         | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1000         | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 1000          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1000          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 1000          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 1000          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 1000          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 1000          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 1000          | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 1000          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 1000          | Learning         |
	And only the following provider payments will be generated
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 1000          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 1000          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 1000          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 1000          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 1000          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 1000          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 1000          | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 1000          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 1000          | Learning         |
Examples: 
        | Collection_Period         | Levy Balance |
        | R01/Current Academic Year | 15500        |
        | R02/Current Academic Year | 14500        |
        | R03/Current Academic Year | 13500        |
        | R04/Current Academic Year | 12500        |
        | R05/Current Academic Year | 11500        |
        | R06/Current Academic Year | 10500        |
        | R07/Current Academic Year | 9500         |
        | R08/Current Academic Year | 8500         |
        | R09/Current Academic Year | 7500         |
        | R10/Current Academic Year | 6500         |
        | R11/Current Academic Year | 5500         |
        | R12/Current Academic Year | 4500         |