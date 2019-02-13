#Feature: Payment Priority
#
#Background: 2 learners, paid in priority order
#
#Scenario: Earnings and payments for two Levy learners, levy is spent in priority order and there is enough levy to fund one and a half learners
#
#        Given Two learners are programme only DAS 
#		And the apprenticeship funding band maximum for each learner is 17000
#        
#		And the employer's levy balance is:
#                | 09/18 | 10/18 | 11/18 | 12/18 | ...  | 09/19 | 10/19 |
#                | 1500  | 1500  | 1500  | 1500  | 1500 | 1500  | 1500  |
#        
#		And the following commitments exist on 03/12/2018:
#                | priority | ULN | start date | end date   | agreed price |
#                | 1        | 123 | 01/08/2018 | 28/08/2019 | 15000        |
#                | 2        | 456 | 01/08/2018 | 28/08/2019 | 15000        |
#        
#		When an ILR file is submitted on 03/12/2018 with the following data:
#                | ULN | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#                | 123 | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |
#                | 456 | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |
#        
#		Then the provider earnings and payments break down for ULN 123 as follows:
#                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
#                | Provider Earned Total          | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
#                | Provider Earned from SFA       | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
#                | Provider Earned from Employer  | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#                | Provider Paid by SFA           | 0     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
#                | Payment due from Employer      | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#                | Levy account debited           | 0     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
#                | SFA Levy employer budget       | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
#                | SFA Levy co-funding budget     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        
#		And the transaction types for the payments for ULN 123 are:
#				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
#				| On-program                     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
#				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
#				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
#		
#		
#		And the provider earnings and payments break down for ULN 456 as follows:
#                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
#                | Provider Earned Total          | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
#                | Provider Earned from SFA       | 950   | 950   | 950   | 950   | ... | 950   | 0     |
#                | Provider Earned from Employer  | 50    | 50    | 50    | 50    | ... | 50    | 0     |
#                | Provider Paid by SFA           | 0     | 950   | 950   | 950   | ... | 950   | 950   |
#                | Payment due from Employer      | 0     | 50    | 50    | 50    | ... | 50    | 50    |
#                | Levy account debited           | 0     | 500   | 500   | 500   | ... | 500   | 500   |
#                | SFA Levy employer budget       | 500   | 500   | 500   | 500   | ... | 500   | 0     |
#                | SFA Levy co-funding budget     | 450   | 450   | 450   | 450   | ... | 450   | 0     |
#                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#        
#		And the transaction types for the payments for ULN 123 are:
#				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
#				| On-program                     | 950   | 950   | 950   | ... | 950   | 950   |
#				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
#				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
#		
#		
#		And OBSOLETE - the provider earnings and payments break down as follows:
#                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
#                | Provider Earned Total          | 2000  | 2000  | 2000  | 2000  | ... | 2000  | 0     |
#                | Provider Earned from SFA       | 1950  | 1950  | 1950  | 1950  | ... | 1950  | 0     |
#                | Provider Earned from Employer  | 50    | 50    | 50    | 50    | ... | 50    | 0     |
#                | Provider Paid by SFA           | 0     | 1950  | 1950  | 1950  | ... | 1950  | 1950  |
#                | Payment due from Employer      | 0     | 50    | 50    | 50    | ... | 50    | 50    |
#                | Levy account debited           | 0     | 1500  | 1500  | 1500  | ... | 1500  | 1500  |
#                | SFA Levy employer budget       | 1500  | 1500  | 1500  | 1500  | ... | 1500  | 0     |
#                | SFA Levy co-funding budget     | 450   | 450   | 450   | 450   | ... | 450   | 0     |
#                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |

Scenario Outline: Two levy learners, full levy available for one learner, partial levy available for the other

	Given the employer levy account balance in collection period  <Collection Period> is <Levy Balance>
	# Commitment lines
	And the following commitments exist
        | Learner ID | priority | start date                   | end date                  | agreed price |
        | learner a  | 1        | 01/Aug/Current Academic Year | 08/Aug/Next Academic Year | 15000        |
        | learner b  | 2        | 01/Aug/Current Academic Year | 08/Aug/Next Academic Year | 15000        |
	And the provider previously submitted the following learner details
		| Learner ID | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| learner a  | 01/Aug/Current Academic Year | 12 months        | 15000                | 01/Aug/Current Academic Year        | 0                      | 01/Aug/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
		| learner b  | 01/Aug/Current Academic Year | 12 months        | 15000                | 01/Aug/Current Academic Year        | 0                      | 01/Aug/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
    And the following earnings had been generated for the learner
        | Learner ID | Delivery Period           | On-Programme | Completion | Balancing |
        | learner a  | Aug/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Sep/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Oct/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Nov/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Dec/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Jan/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Feb/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Mar/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Apr/Current Academic Year | 500          | 0          | 0         |
        | learner a  | May/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Jun/Current Academic Year | 500          | 0          | 0         |
        | learner a  | Jul/Current Academic Year | 500          | 0          | 0         |
        | learner b  | Aug/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Sep/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Oct/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Nov/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Dec/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Jan/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Feb/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Mar/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Apr/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | May/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Jun/Current Academic Year | 1000         | 0          | 0         |
        | learner b  | Jul/Current Academic Year | 1000         | 0          | 0         |
	# Levy Payments
    And the following provider payments had been generated
        | Learner ID | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Levy Payments | Transaction Type |
        | learner a  | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 500           | Learning         |
        | learner a  | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 500           | Learning         |
        | learner a  | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 500           | Learning         |
        | learner b  | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | learner b  | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | learner b  | R03/Current Academic Year | Oct/Current Academic Year | 720                    | 80                          | 200           | Learning         |
    But the employer now changes the commitment as follows
        | Learner ID | priority | start date                   | end date                     | agreed price |
        | learner a  | 2        | 01/Aug/Current Academic Year | 08/Aug/Current Academic Year | 7500         |
        | learner b  | 1        | 01/Aug/Current Academic Year | 08/Aug/Current Academic Year | 15000        |
	And the Provider now changes the Learner details as follows
		| Learner ID | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| learner a  | 01/Aug/Current Academic Year | 12 months        | 7500                 | 01/Aug/Current Academic Year        | 0                      | 01/Aug/Current Academic Year          | 12 months       | completed         | Act1          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
		| learner b  | 01/Aug/Current Academic Year | 12 months        | 15000                | 01/Aug/Current Academic Year        | 0                      | 01/Aug/Current Academic Year          | 12 months       | completed         | Act1          | 1                   | ZPROG001      | 403            | 1            | 2              | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period R04/Current Academic Year
	Then the following learner earnings should be generated
		| Learner ID | Delivery Period           | On-Programme | Completion | Balancing |
		| learner a  | Aug/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Sep/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Oct/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Nov/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Dec/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Jan/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Feb/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Mar/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Apr/Current Academic Year | 500          | 0          | 0         |
		| learner a  | May/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Jun/Current Academic Year | 500          | 0          | 0         |
		| learner a  | Jul/Current Academic Year | 500          | 0          | 0         |
		| learner b  | Aug/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Sep/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Oct/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Nov/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Dec/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Jan/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Feb/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Mar/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Apr/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | May/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Jun/Current Academic Year | 1000         | 0          | 0         |
		| learner b  | Jul/Current Academic Year | 1000         | 0          | 0         |
    And at month end only the following payments will be calculated
        | Learner ID | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | learner a  | R04/Current Academic Year | Nov/Current Academic Year | 500          | 0          | 0         |
        | learner b  | R04/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         |
	# Levy Payments
	And only the following provider payments will be recorded
        | Learner ID | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Levy Payments | Transaction Type |
        | learner a  | R04/Current Academic Year | Nov/Current Academic Year | 225                    | 25                          | 250           | Learning         |
        | learner b  | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
	And only the following provider payments will be generated
        | Learner ID | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Levy Payments | Transaction Type |
        | learner a  | R04/Current Academic Year | Nov/Current Academic Year | 225                    | 25                          | 250           | Learning         |
        | learner b  | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 1000          | Learning         |  
Examples: 
        | Collection_Period         | Levy Balance |
        | R01/Current Academic Year | 1500         |
        | R02/Current Academic Year | 1500         |
        | R03/Current Academic Year | 700         |
        | R04/Current Academic Year | 1250         |
