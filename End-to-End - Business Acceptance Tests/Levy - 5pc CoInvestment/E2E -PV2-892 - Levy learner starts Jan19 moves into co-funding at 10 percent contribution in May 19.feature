#Feature: 5% Contribution from April 2019
#
#Scenario: Levy Learner, starts learning in Jan19 runs out of Levy and goes into co-funding in May19, 10% contribution 
#
#Background: The example is demonstrating an employer flagged at 'Levy' ACT1 runs out of funding in May and goes into co-funding
#			co-funding contribution at 10% as the learning is not new learning from Apr19
#	
#    Given The learner is programme only Levy with co-funding
#	And the apprenticeship funding band maximum is 15000
#    
#	And the employer's levy balance is:
#        | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 |
#        | 1000  | 1000  | 1000  | 1000  | 0     | 0     |
#	
#	And the following commitment exist:
#        | ULN       | priority | start date | end date   | agreed price |
#        | learner a | 1        | 01/01/2019 | 01/01/2020 | 15000        |
#    
#    
#	When an ILR file is submitted R06 (Jan 2019) with the following data:
#          
#        | ULN       | learner type           | start date | planned end date | actual end date | Agreed Price  | completion status | aim type      | aim sequence number | framework code | programme type | pathway code |
#		| learner a | programme only DAS     | 04/01/2019 | 06/01/2020       |                 | 15,000		   | continuing        | programme     | 1                   | 403            | 2              | 1            |
#
#
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | Provider Earned Total                   | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  |
#        | Provider Earned from SFA                | 1000  | 1000  | 1000  | 1000  | 900   | 900   | 900   |
#        | Provider Earned from Employer           | 0     | 0     | 0     | 0     | 100   | 100   | 100   |
#        | Provider Paid by SFA                    | 0     | 1000  | 1000  | 1000  | 1000  | 900   | 900   |
#        | Payment due from Employer               | 0     | 0     | 0     | 0     | 0     | 100   | 100   |
#        | Levy account debited                    | 0     | 1000  | 1000  | 1000  | 1000  | 0     | 0     |
#        | SFA Levy employer budget                | 1000  | 1000  | 1000  | 1000  | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 900   | 900   | 900   |
#		| SFA non-Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#
#    And the transaction types for the payments are:
#        | Payment type                 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | On-program                   | 1000  | 1000  | 1000  | 1000  | 900   | 900   |
#        | Completion                   | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Balancing                    | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Provider 16-18 incentive     | 0     | 0     | 0     | 0     | 0     | 0     |

Feature:  5% Contribution from April 2019 PV2-892
As a provider,
I want a Levy learner, starting in Jan 2019, where employer runs out of Levy in May'19 and learner is co-funded from May'19 at 10% contribution
 5% Contribution from April 2019
Scenario Outline: Levy Learner, starts learning in Jan19 runs out of Levy and goes into co-funding in May19, 10% contribution 
	Given the employer levy account balance in collection period <Collection_Period> is <Levy Balance>
		
	And the following apprenticeships exist
		| Apprenticeship | Provider   | Learner ID | framework code | programme type | pathway code | agreed price | start date                   | end date                  | status | effective from               |
		| Apprentice a   | Provider a | learner a  | 593            | 20             | 1            | 15000        | 01/Jan/Current Academic Year | 01/Jan/Next Academic Year | active | 01/Jan/Current Academic Year |	
    
	And the provider is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                  | SFA Contribution Percentage |
		| 01/Jan/Current Academic Year | 12 months        | 15000                | 01/Jan/Current Academic Year        |                        |                                       |                 | continuing        | Act1          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship Levy Contract | 90%                         |

	When the ILR file is submitted for the learners for collection period <Collection_Period>

	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 0            | 0          | 0         |
		| Sep/Current Academic Year | 0            | 0          | 0         |
		| Oct/Current Academic Year | 0            | 0          | 0         |
		| Nov/Current Academic Year | 0            | 0          | 0         |
		| Dec/Current Academic Year | 0            | 0          | 0         |
		| Jan/Current Academic Year | 1000         | 0          | 0         |
		| Feb/Current Academic Year | 1000         | 0          | 0         |
		| Mar/Current Academic Year | 1000         | 0          | 0         |
		| Apr/Current Academic Year | 1000         | 0          | 0         |
		| May/Current Academic Year | 1000         | 0          | 0         |
		| Jun/Current Academic Year | 1000         | 0          | 0         |
		| Jul/Current Academic Year | 1000         | 0          | 0         |


    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         |
        | R07/Current Academic Year | Feb/Current Academic Year | 1000         | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1000         | 0          | 0         |
        | R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         |
        | R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         |

	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Levy Payments | Transaction Type |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | 0             | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | 0             | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | 0             | Learning         |

	And only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Levy Payments | Transaction Type |
		| R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 1000          | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | 0             | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | 0             | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | 0             | Learning         |
   
   Examples: 
        | Collection_Period         | Levy Balance |
        | R06/Current Academic Year | 1000         |
        | R07/Current Academic Year | 1000         |
        | R08/Current Academic Year | 1000         |
        | R09/Current Academic Year | 1000         |
        | R10/Current Academic Year | 0            |
        | R11/Current Academic Year | 0            |
        | R12/Current Academic Year | 0            |