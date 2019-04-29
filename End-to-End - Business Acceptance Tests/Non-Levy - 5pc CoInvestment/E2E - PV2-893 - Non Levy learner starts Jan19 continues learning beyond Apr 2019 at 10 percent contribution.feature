#Feature: 5% Contribution from April 2019
#
#Scenario: Non Levy Learner, starts learning in Jan19, 10% contribution 
#
#Background: The example is demonstrating an employer flagged at 'Non Levy' ACT2 starts learning pre April 2019
#			and contribution remains at 10% as the learning is not in new learning from Apr19
#	
#    Given The learner is programme only Non Levy 
#	And the apprenticeship funding band maximum is 15000
#     
#    
#	When an ILR file is submitted R06 (Jan 2019) with the following data:
#          
#        | ULN       | learner type           | start date | planned end date | actual end date | Agreed Price  | completion status | aim type      | aim sequence number | framework code | programme type | pathway code |
#		| learner a | programme only DAS     | 04/01/2019 | 06/01/2020       |                 | 15,000		   | continuing        | programme     | 1                   | 403            | 2              | 1            |
#
#
#    Then the provider earnings and payments break down as follows:
#        | Type                                    | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 |
#        | Provider Earned Total                   | 1000  | 1000  | 1000  | 1000  | 1000  |
#        | Provider Earned from SFA                | 900   | 900   | 900   | 900   | 900   |
#        | Provider Earned from Employer           | 100   | 100   | 100   | 100   | 100   |
#        | Provider Paid by SFA                    | 0     | 900   | 900   | 900   | 900   |
#        | Payment due from Employer               | 0     | 100   | 100   | 100   | 100   |
#        | Levy account debited                    | 0     | 0     | 0     | 0     | 0     |
#        | SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     |
#		| SFA non-Levy co-funding budget          | 900   | 900   | 900   | 900   | 900   |
#        | SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 0     |
#
#    And the transaction types for the payments are:
#        | Payment type                 | 02/19 | 03/19 | 04/19 | 05/19 |
#        | On-program                   | 900   | 900   | 900   | 900   |
#        | Completion                   | 0     | 0     | 0     | 0     |
#        | Balancing                    | 0     | 0     | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | 0     | 0     |
#        | Provider 16-18 incentive     | 0     | 0     | 0     | 0     |




Feature: 5% Contribution from April 2019 PV2-893
As a provider,
I want a Non Levy learner, starting in Jan 2019, at 10% contribution
So that I am paid the correct apprenticeship funding by SFA

Scenario Outline: Non Levy Learner, starts learning in Jan19, 10% contribution 

	Given the apprenticeship funding band maximum is 15000

	And the provider is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 06/Jan/Current Academic Year | 12 months        | 15000                | 06/Jan/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |

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
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
		| R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         |
		| R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         |
		| R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         |
		| R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         |
		| R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         |
														
	And only the following provider payments will be generated
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
		| R06/Current Academic Year | 
		| R07/Current Academic Year |
		| R08/Current Academic Year |
		| R09/Current Academic Year | 
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |
        