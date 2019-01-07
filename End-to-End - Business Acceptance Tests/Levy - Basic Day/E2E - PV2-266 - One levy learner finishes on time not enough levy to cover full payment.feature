#1 Levy Learner, not enough levy to cover full payment
#
#        Given the employer's levy balance is:
#            | 10/18 | 11/18 | 12/18 | ... | 09/19 | 10/19 |
#            | 500   | 500   | 500   | 500 | 500   | 1500  |
#		
#		And the following commitments exist:
#            | ULN       | priority | start date | end date   | agreed price |
#            | learner a | 1        | 01/09/2018 | 08/09/2019 | 15000        |
#        
#		When an ILR file is submitted with the following data:
#            | ULN       | learner type       | agreed price | start date | planned end date | actual end date | completion status |
#            | learner a | programme only DAS | 15000        | 01/09/2018 | 08/09/2019       | 08/09/2019      | completed         |
#        
#		Then the provider earnings and payments break down as follows:
#            | Type                          | 09/18 | 10/18 | 11/18 | ... | 08/19 | 09/19 | 10/19 |
#            | Provider Earned Total         | 1000  | 1000  | 1000  | ... | 1000  | 3000  | 0     |
#            | Provider Earned from SFA      | 950   | 950   | 950   | ... | 950   | 2850  | 0     |
#            | Provider Earned from Employer | 50    | 50    | 50    | ... | 50    | 150   | 0     |
#            | Provider Paid by SFA          | 0     | 950   | 950   | ... | 950   | 950   | 2850  |
#            | Payment due from Employer     | 0     | 50    | 50    | ... | 50    | 50    | 150   |
#            | Levy account debited          | 0     | 500   | 500   | ... | 500   | 500   | 1500  |
#            | SFA Levy employer budget      | 500   | 500   | 500   | ... | 500   | 1500  | 0     |
#            | SFA Levy co-funding budget    | 450   | 450   | 450   | ... | 450   | 1350  | 0     |
#            | SFA non-Levy co-funding budget| 0     | 0     | 0     | ... | 0     | 0     | 0     |

## Given levy balance table
## Commitments line
## SFA Levy Payment - partial
## and levy acccount has been debited

Scenario Outline: One levy learner, not enough levy available to cover full payment, finished on time PV2-266
	# New levy balance table
	# By default this table will be for single employer but in case of multiple employers it will have additional column
	# Should we split the table into multi-year?
	Given the following levy balance is available
		| Levy Balance Period       | Levy Balance |
		| Oct/Last Academic Year    | 500          |
		| Nov/Last Academic Year    | 500          |
		| Dec/Last Academic Year    | 500          |
		| Jan/Last Academic Year    | 500          |
		| Feb/Last Academic Year    | 500          |
		| Mar/Last Academic Year    | 500          |
		| Apr/Last Academic Year    | 500          |
		| May/Last Academic Year    | 500          |
		| Jun/Last Academic Year    | 500          |
		| Jul/Last Academic Year    | 500          |
		| Aug/Current Academic Year | 500          |
		| Sep/Current Academic Year | 500          |
		| Oct/Current Academic Year | 1500         |
	# Commitment line
	And the following commitments exist
        | ULN       | priority | start date | end date   | agreed price |
        | learner a | 1        | 01/09/2018 | 08/09/2019 | 15000        |
	And the provider previously submitted the following learner details
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 01/Sep/Last Academic Year | 12 months        | 15000                | 01/Sep/Last Academic Year           | 0                      | 01/Sep/Last Academic Year             |                 | continuing        | Act1          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
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
	# SFA Levy Payment - partially available
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R02/Last Academic Year | Sep/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R03/Last Academic Year | Oct/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R04/Last Academic Year | Nov/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R05/Last Academic Year | Dec/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R06/Last Academic Year | Jan/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R07/Last Academic Year | Feb/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R08/Last Academic Year | Mar/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R09/Last Academic Year | Apr/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R10/Last Academic Year | May/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R11/Last Academic Year | Jun/Last Academic Year | 450                    | 50                          | 500               | Learning         |
        | R12/Last Academic Year | Jul/Last Academic Year | 450                    | 50                          | 500               | Learning         |
	And the following levy balance had been debited
		| Collection Period      | Levy Balance Period       | Levy Balance |
		| R02/Last Academic Year | Oct/Last Academic Year    | 0            |
		| R03/Last Academic Year | Nov/Last Academic Year    | 0            |
		| R04/Last Academic Year | Dec/Last Academic Year    | 0            |
		| R05/Last Academic Year | Jan/Last Academic Year    | 0            |
		| R06/Last Academic Year | Feb/Last Academic Year    | 0            |
		| R07/Last Academic Year | Mar/Last Academic Year    | 0            |
		| R08/Last Academic Year | Apr/Last Academic Year    | 0            |
		| R09/Last Academic Year | May/Last Academic Year    | 0            |
		| R10/Last Academic Year | Jun/Last Academic Year    | 0            |
		| R11/Last Academic Year | Jul/Last Academic Year    | 0            |
		| R12/Last Academic Year | Aug/Current Academic Year | 0            |
    But the Provider now changes the Learner details as follows
		| Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 01/Sep/Last Academic Year | 12 months        | 15000                | 01/Sep/Last Academic Year           | 0                      | 01/Sep/Last Academic Year             | 12 months       | completed         | Act1          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 1000         | 0          | 0         |
		| Sep/Current Academic Year | 0            | 3000       | 0         |
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
        | R02/Current Academic Year | Sep/Current Academic Year | 0            | 3000       | 0         |
	# SFA Levy Payment - partial
	# and levy acccount has been debited
	And only the following provider payments will be recorded and levy acccount has been debited
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 450                    | 50                          | 500               | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1350                   | 150                         | 1500              | Completion       |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 450                    | 50                          | 500               | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1350                   | 150                         | 1500              | Completion       |
	And only the following levy balance will be debited
		| Collection Period         | Levy Balance Period       | Levy Balance |
		| R01/Current Academic Year | Sep/Current Academic Year | 0            |
		| R02/Current Academic Year | Oct/Current Academic Year | 0            |
Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |