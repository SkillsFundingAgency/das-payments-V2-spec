Feature: One Non-levy learner - change to start date within calendar month, backwards in month PV2-283

As a provider,
I want a non-levy learner, where change to start date within calendar month, backwards in month is paid the correct amount
So that I am accurately paid my apprenticeship provision.

@EndToEnd

Scenario Outline: Change to start date within calendar month, backwards in month PV2-283
Given the provider previously submitted the following learner details
	| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | SFA Contribution Percentage |
	| 05/Aug/Current Academic Year | 12 months        | 9000                 | 05/Aug/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | 90%                         |
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
But the Provider now changes the Learner details as follows
	| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | SFA Contribution Percentage |
	| 04/Aug/Current Academic Year | 12 months        | 9000                 | 04/Aug/Current Academic Year        |                        |                                       |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | 90%                         |
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

#Scenario: non-DAS Learner - Change to start date within calendar month, backwards in month
#	Given the apprenticeship funding band maximum is 9000
#		       
#    When an ILR file is submitted for period R01 with the following data:
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim sequence number | framework code | programme type | pathway code |
#        | learner a | programme only non-DAS | 9000         | 05/08/2017 | 20/08/2018       |                 | continuing        | programme        | 1                   | 403            | 2              | 1            |
#            
#	And an ILR file is submitted for period R03 with the following data:
#        | ULN       | learner type       | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim sequence number | framework code | programme type | pathway code |
#        | learner a | programme only non-DAS | 9000         | 04/08/2017 | 20/08/2018       |                 | continuing        | programme        | 1                   | 403            | 2              | 1            |     
#		
#	Then the provider earnings and payments break down as follows:
#        | Type                                | 08/17 | 09/17 | 10/17 | 11/17 |
#        | Provider Earned Total               | 600   | 600   | 600   | 600   |
#        | Provider Earned from SFA            | 540   | 540   | 540   | 600   |
#        | Provider Earned from Employer       | 60    | 60    | 60    | 0     |
#        | Provider Paid by SFA                | 0     | 540   | 540   | 540   |
#        | Payment due from Employer           | 0     | 60    | 60    | 60    |
#        | Levy account debited                | 0     | 0     | 0     | 0     |
#        | SFA Levy employer budget            | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget          | 0     | 0     | 0     | 0     |
#        | SFA Levy additional payments budget | 0     | 0     | 0     | 0     |
#        | SFA non-Levy co-funding budget      | 540   | 540   | 540   | 540   |