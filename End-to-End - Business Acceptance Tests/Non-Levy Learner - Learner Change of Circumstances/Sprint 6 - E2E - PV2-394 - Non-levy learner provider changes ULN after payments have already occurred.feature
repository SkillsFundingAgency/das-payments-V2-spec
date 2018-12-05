#Non-Levy apprentice, provider changes ULN for an apprentice in the ILR after payments have already occurred
#
#        Given the apprenticeship funding band maximum is 9000
#       
#        When an ILR file is submitted for period R01 with the following data:
#		
#			| learner reference number | ULN        | learner type           | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code |
#			| learner a                | 1111111111 | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | 403            | 2              | 1            |
#        
#        And an ILR file is submitted for period R03 with the following data:
#		
#			| learner reference number | ULN        | learner type           | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code |
#			| learner a                | 2222222222 | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | 403            | 2              | 1            |
#        
#        Then the provider earnings and payments break down as follows:
#			| Type                                    | 08/18 | 09/18 | 10/18 | 11/18 |
#			| Provider Earned Total                   | 600   | 600   | 600   | 600   |
#			| Provider Earned from SFA                | 540   | 540   | 540   | 540   |
#			| Provider Earned from Employer           | 60    | 60    | 60    | 60    |
#			| Provider Paid by SFA                    | 0     | 540   | 540   | 540   |
#			| Refund taken by SFA                     | 0     | 0     | 0     | 0     |
#			| Payment due from Employer               | 0     | 60    | 60    | 60    |
#			| Refund due to employer                  | 0     | 0     | 0     | 0     |
#			| Levy account debited                    | 0     | 0     | 0     | 0     |
#			| Levy account credited                   | 0     | 0     | 0     | 0     |
#			| SFA Levy employer budget                | 0     | 0     | 0     | 0     |
#			| SFA Levy co-funding budget              | 0     | 0     | 0     | 0     |
#			| SFA Levy additional payments budget     | 0     | 0     | 0     | 0     |
#			| SFA non-Levy co-funding budget          | 540   | 540   | 540   | 540   |
#			| SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 

#Notes: ULN in first ILR line
#New step - just change ULN

#	But the Provider now changes the Learner details as follows
#        | ULN        | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
#        | 2222222222 | 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |


Feature: Non-Levy apprentice, provider changes ULN for an apprentice in the ILR after payments have already occurred

Scenario Outline: Non-levy learner provider changes ULN after payments have already occurred PV2-394
	Given the provider previously submitted the following learner details
		# Temp/old ULN
        | ULN        | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
        | 1111111111 | 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 600          | 0          | 0         |
        | Sep/Current Academic Year | 600          | 0          | 0         |
        | Oct/Current Academic Year | 600          | 0          | 0         |
        | Nov/Current Academic Year | 600          | 0          | 0         |
        | Dec/Current Academic Year | 600          | 0          | 0         |
        | Jan/Current Academic Year | 600          | 0          | 0         |
        | Feb/Current Academic Year | 600          | 0          | 0         |
        | Mar/Current Academic Year | 600          | 0          | 0         |
        | Apr/Current Academic Year | 600          | 0          | 0         |
        | May/Current Academic Year | 600          | 0          | 0         |
        | Jun/Current Academic Year | 600          | 0          | 0         |
        | Jul/Current Academic Year | 600          | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 540                    | 60                          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 540                    | 60                          | Learning         |
	# New ULN
    But the Provider now changes the Learner's ULN to "222222"
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 600          | 0          | 0         |
        | Sep/Current Academic Year | 600          | 0          | 0         |
        | Oct/Current Academic Year | 600          | 0          | 0         |
        | Nov/Current Academic Year | 600          | 0          | 0         |
        | Dec/Current Academic Year | 600          | 0          | 0         |
        | Jan/Current Academic Year | 600          | 0          | 0         |
        | Feb/Current Academic Year | 600          | 0          | 0         |
        | Mar/Current Academic Year | 600          | 0          | 0         |
        | Apr/Current Academic Year | 600          | 0          | 0         |
        | May/Current Academic Year | 600          | 0          | 0         |
        | Jun/Current Academic Year | 600          | 0          | 0         |
        | Jul/Current Academic Year | 600          | 0          | 0         |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R03/Current Academic Year | Oct/Current Academic Year | 600          | 0          | 0         |
        | R04/Current Academic Year | Nov/Current Academic Year | 600          | 0          | 0         |
        | R05/Current Academic Year | Dec/Current Academic Year | 600          | 0          | 0         |
        | R06/Current Academic Year | Jan/Current Academic Year | 600          | 0          | 0         |
        | R07/Current Academic Year | Feb/Current Academic Year | 600          | 0          | 0         |
        | R08/Current Academic Year | Mar/Current Academic Year | 600          | 0          | 0         |
        | R09/Current Academic Year | Apr/Current Academic Year | 600          | 0          | 0         |
        | R10/Current Academic Year | May/Current Academic Year | 600          | 0          | 0         |
        | R11/Current Academic Year | Jun/Current Academic Year | 600          | 0          | 0         |
        | R12/Current Academic Year | Jul/Current Academic Year | 600          | 0          | 0         |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | Learning         |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Oct/Current Academic Year | 540                    | 60                          | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 540                    | 60                          | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 540                    | 60                          | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 540                    | 60                          | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 540                    | 60                          | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 540                    | 60                          | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 540                    | 60                          | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | Learning         |
Examples: 
        | Collection_Period         |
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