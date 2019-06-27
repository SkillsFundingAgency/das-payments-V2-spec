#Feature: 5% Contribution from April 2019
#
#Scenario: Non Levy Learner, started learning before Apr19, changes Employer from Apr19 on the same course and price, remains on 10% contribution
#
#Background: The example is demonstrating an employer flagged as 'Non Levy' ACT2 starts learning pre April 2019 changes Employer after Apr19
#			and remains at 10% contribution as the learning is not new learning from Apr19
#	
#    Given The learner is programme only Non Levy 
#	And the apprenticeship funding band maximum is 15000
#    
#	And the learner changes employers
#        | Employer    | Type    | ILR employment start date |   
#        | employer 1  | Non-DAS | 01/08/2018                |
#        | employer 2  | Non-DAS | 01/04/2019                |
#	
#	When an ILR file is submitted with the following data:  
#		| ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | learner a | 01/08/2018 | 08/08/2019       | 			      | continuing	      | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |
#
#    And the Contract type in the ILR is:
#        | contract type | date from  | date to    |
#        | Non-DAS       | 01/08/2018 | 31/03/2019 |
#        | Non-DAS       | 01/04/2019 | 08/08/2019 |
#    
#	And the employment status in the ILR is:
#        | Employer   | Employment Status      | Employment Status Applies |
#        | employer 1 | in paid employment     | 01/08/2018                |
#        | employer 2 | in paid employment     | 01/04/2019                |     
#		
#	
#	Then the provider earnings and payments break down as follows:		
#        | Type                          | 08/18 | 09/18 | 10/19 | ... | 04/19 | 05/19 | ... | 07/19 | 08/19 |
#        | Provider Earned Total         | 1000  | 1000  | 1000  | ... | 1000  | 1000  | ... | 1000  | 0     |           
#		| Provider Earned from SFA      | 900   | 900   | 900   | ... | 900   | 900   | ... | 900   | 0     |
#        | Provider Earned from Employer | 100   | 100   | 100   | ... | 100   | 100   | ... | 100   | 0     |	
#		| Provider Paid by SFA          | 0     | 900   | 900   | ... | 900   | 900   | ... | 900   | 900   |
#        | Payment due from Employer     | 0     | 100   | 100   | ... | 100   | 100   | ... | 100   | 100   |
#        | Levy account debited          | 0     | 0     | 0     |  ...| 0     | 0     |  ...| 0     | 0     |
#        | SFA Levy employer budget      | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#        | SFA Levy co-funding budget    | 0     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#        | SFA non-Levy co-funding budget| 900   | 900   | 900   | ... | 900   | 900   | ... | 900   | 0     |
#		
#    
#	And the transaction types for the payments are:
#        | Payment type                 | 09/18 | 10/18 | ... | 04/19 | 05/19 | ... | 07/19 | 08/19 |
#        | On-program                   | 900   | 900   | ... | 900   | 900   | ... | 900   | 900   |
#        | Completion                   | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#        | Balancing                    | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#        | Employer 16-18 incentive     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |
#        | Provider 16-18 incentive     | 0     | 0     | ... | 0     | 0     | ... | 0     | 0     |

Feature: 5% Contribution from April 2019 PV2-896
As a provider,
I want a Non Levy learner, starting prior to Apr 2019, where learner changes Employer from Apr 2019 but stays on same course and price, remains at 10% contribution
So that I am paid the correct apprenticeship funding by SFA

Scenario Outline: Earnings and payments for a non-levy learner, switches from non-levy to non levy employer at the end of month- PV2-896
Given the apprenticeship funding band maximum is 15000

And the provider previously submitted the following learner details
	| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                      | SFA Contribution Percentage |
	| 03/Aug/Current Academic Year | 12 months        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 17            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract | 90%                         |

And the following earnings had been generated for the learner
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

And the following provider payments had been generated
	| Collection Period         | Delivery Period           | Levy Payments | Transaction Type | Employer   |
	| R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning         | employer 1 |
	| R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning         | employer 1 |
	| R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning         | employer 1 |
	| R04/Current Academic Year | Nov/Current Academic Year | 1000          | Learning         | employer 1 |
	| R05/Current Academic Year | Dec/Current Academic Year | 1000          | Learning         | employer 1 |
	| R06/Current Academic Year | Jan/Current Academic Year | 1000          | Learning         | employer 1 |
	| R05/Current Academic Year | Feb/Current Academic Year | 1000          | Learning         | employer 1 |
	| R06/Current Academic Year | Mar/Current Academic Year | 1000          | Learning         | employer 1 |

But the Provider now changes the Learner details as follows
	| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                      |
	| 03/Aug/Current Academic Year | 12 months        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 17            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract |

And price details as follows
	| Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date | SFA Contribution Percentage |
	| 1st price details | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | 0                       |                                        | 0                         |                                          | 90%                         |
	| 2nd price details | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | 3200                    | 03/Apr/Current Academic Year           | 800                       | 03/Apr/Current Academic Year             | 90%                         |

When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>

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
	| R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         |
	| R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         |
	| R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         |
	| R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         |

And only the following provider payments will be recorded
	| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Employer   |
	| R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |

And only the following provider payments will be generated
	| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Employer   |
	| R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
	| R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         | employer 2 |
Examples: 
	| Collection_Period         |
	| R09/Current Academic Year |
	| R10/Current Academic Year |
	| R11/Current Academic Year |
	| R12/Current Academic Year |