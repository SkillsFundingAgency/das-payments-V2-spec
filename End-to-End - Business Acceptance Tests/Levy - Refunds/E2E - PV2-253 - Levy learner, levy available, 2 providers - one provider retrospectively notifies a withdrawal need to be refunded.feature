#Scenario: 683-AC01- DAS learner, levy available, 2 providers - provider A and provider B, Provider B retrospectively notifies a withdrawal and previously-paid monthly instalments need to be refunded, 
#and this refund must be credited to Provider A where refunded Levy amount will be in excess of the available Levy for that period.
#
#	Given The learner is programme only DAS
#	And the apprenticeship funding band maximum is 17000
#	And the employer's levy balance is:
#        | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | 0     | 1125  | 1125  | 1125  | 1125  | 1125  | 1125  |
#	And the following commitments exist:
#		| commitment Id | Provider   | version Id | ULN       | start date | end date   | status | standard code | programme type	| agreed price | effective from | effective to |
#		| 1             | Provider A | 1          | Learner A | 01/08/2018 | 01/08/2019 | active | 25            | 25				| 5625         | 01/08/2018     |              |
#		| 2             | Provider B | 1          | Learner B | 01/08/2018 | 01/08/2019 | active | 25            | 25				| 11250        | 01/08/2018     |              |
#	
#	And following learning has been recorded for previous payments:
#		| ULN       | start date | aim sequence number | completion status | standard code | programme type |
#		| Learner A | 04/08/2018 | 1                   | continuing        | 25            | 25				|
#		| Learner B | 04/08/2018 | 1                   | continuing        | 25            | 25				|
#
#
#	And the following earnings and payments have been made to the Provider A for Learner A:
#		| Type                                | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |01/19|     
#		| Provider Earned Total               | 375   | 375   | 375   | 375   | 375   | 0   |
#		| Provider Paid by SFA                | 375   | 375   | 375   | 375   | 375   | 0   | 
#		| Provider Earned from Employer       | 0     | 0     | 0     | 0     |  0    | 0   |
#		| Provider Paid by SFA                |  0    | 375   | 375   | 375   | 375   | 375 |
#		| Payment due from Employer           | 0     | 0     | 0     | 0     |   0   | 0   |
#		| Levy account debited                | 0     | 375   | 375   | 375   | 375   | 0   | 
#		| SFA Levy employer budget            | 375   | 375   | 375   | 375   | 375   | 0   | 
#		| SFA Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | 0   | 
#	And the following earnings and payments have been made to the Provider B for Learner B:
#		| Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 |
#		| Provider Earned Total         | 750   | 750   | 750   | 750   | 750   | 0     |
#		| Provider Earned from SFA      | 750   | 750   | 750   | 750   | 750   | 0     |
#		| Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Provider Paid by SFA          | 0     | 750   | 750   | 750   | 750   | 750   |
#		| Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Levy account debited          | 0     | 750   | 750   | 750   | 750   | 750   |
#		| SFA Levy employer budget      | 750   | 750   | 750   | 750   | 750   | 0     |
#		| SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     |  
#		
#    When an ILR file is submitted for the first time on 10/01/19 with the following data:
#		| ULN       | Provider   | start date | planned end date | actual end date | completion status | standard code | programme type		| Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#		| Learner A | Provider A | 04/08/2018 | 20/08/2019       |                 | Continuing        | 25            | 25					| 4500                 | 04/08/2018                          | 1125                   | 04/08/2018                            |
#		| Learner B | Provider B | 04/08/2018 | 20/08/2019       | 12/11/2018      | withdrawn         | 25            | 25					| 9000                 | 04/08/2018                          | 2250                   | 04/08/2018                            |
#
#    Then OBSOLETE - the earnings and payments break down for provider A is as follows:
#		| Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 |
#		| Provider Earned Total         | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Provider Earned from SFA      | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Provider Paid by SFA          | 0     | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Refund taken by SFA           | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Levy account debited          | 0     | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Levy account credited         | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| SFA Levy employer budget      | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#
#    Then OBSOLETE - the earnings and payments break down for provider B is as follows:
#        | Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 |
#        | Provider Earned Total         | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | Provider Earned from SFA      | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Provider Paid by SFA          | 0     | 750   | 750   | 750   | 750   | 750   | 0     |
#        | Refund taken by SFA           | 0     | 0     | 0     | 0     | 0     | 0     | -1500 |
#        | Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Levy account debited          | 0     | 750   | 750   | 750   | 750   | 750   | 0     |
#        | Levy account credited         | 0     | 0     | 0     | 0     | 0     | 0     | 1500  |
#        | SFA Levy employer budget      | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#	 And the net effect on employer's levy balance after each period end is:
#        | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | -1125 | 750   | 750   | 750   | 750   | 750   | 750   |

#Scenario:673-AC03 DAS learner, insufficient levy available to cover full payments, provider retrospectively notifies a withdrawal and previously-paid monthly instalments need to be refunded.	Given The learner is programme only DAS
#    Given The learner is programme only DAS
#	And the apprenticeship funding band maximum is 17000
#    And levy balance > agreed price for all months
#	And the following commitments exist:
#		  | commitment Id | version Id | ULN       | start date | end date   | status | agreed price | effective from | effective to | programme type	|
#		  | 1             | 1          | learner a | 01/08/2018 | 01/08/2019 | active | 11250        | 01/08/2018     |              | 25				|
#	And following learning has been recorded for previous payments:
#		| ULN       | start date | aim sequence number |  completion status | programme type	|
#		| learner a | 04/08/2018 | 1                   |  continuing        | 25				|
#  
#	And the following earnings and payments have been made to the provider A for learner a:
#		| Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 |
#		| Provider Earned Total         | 750   | 750   | 750   | 750   | 750   | 0     |       
#		| Provider Earned from SFA      | 725   | 725   | 725   | 725   | 725   | 0     |       
#		| Provider Earned from Employer | 25    | 25    | 25    | 25    | 25    | 0     |       
#		| Provider Paid by SFA          | 0     | 725   | 725   | 725   | 725   | 725   |        
#		| Payment due from Employer     | 0     | 25    | 25    | 25    | 25    | 25    |       
#		| Levy account debited          | 0     | 500   | 500   | 500   | 500   | 500   |         
#		| SFA Levy employer budget      | 500   | 500   | 500   | 500   | 500   | 0     |        
#		| SFA Levy co-funding budget    | 225   | 225   | 225   | 225   | 225   | 0     |       
#    When an ILR file is submitted for the first time on 10/01/19 with the following data:
#        | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | programme type	|
#        | learner a | 04/08/2018 | 20/08/2019       | 12/11/2018      | withdrawn         | 9000                 | 04/08/2018                          | 2250                   | 04/08/2018                            | 25				|
#	Then the provider earnings and payments break down as follows:
#        | Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 |
#        | Provider Earned Total         | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | Provider Earned from SFA      | 725   | 725   | 725   | 0     | 0     | 0     | 0     |
#        | Provider Earned from Employer | 25    | 25    | 25    | 0     | 0     | 0     | 0     |
#        | Provider Paid by SFA          | 0     | 725   | 725   | 725   | 725   | 725   | 0     |
#        | Refund taken by SFA           | 0     | 0     | 0     | 0     | 0     | 0     | -1450 |
#        | Payment due from Employer     | 0     | 25    | 25    | 25    | 25    | 25    | 0     |
#        | Levy account debited          | 0     | 500   | 500   | 500   | 500   | 500   | 0     |
#        | Levy account credited         | 0     | 0     | 0     | 0     | 0     | 0     | 1000  |
#        | SFA Levy employer budget      | 500   | 500   | 500   | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget    | 225   | 225   | 225   | 0     | 0     | 0     | 0     |

Scenario:  A levy learner in co-funding and provider retrospectively notifies of a withdrawal after payments have already been made PV2-252

    Given The employer levy account balance is 2500 

	And the following commitment exists
		| commitment Id | version Id | ULN       | start date                   | end date                     | status | agreed price | effective from               | effective to | programme type |
		| 1             | 1          | learner a | 01/Aug/Current Academic Year | 31/Jul/Current Academic Year | active | 11250        | 01/Aug/Current Academic Year |              | 25             |

	And the provider previously submitted the following learner details
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  |
        | learner a | 1        | start of academic year | 12 months        | 11250                | Aug/Current Academic Year           | Aug/Current Academic Year            |                 | continuing        | 0                           | ContractWithEmployer | 1                   | ZPROG001      | 17            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract |

    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 750          | 0          | 0         |
        | Sep/Current Academic Year | 750          | 0          | 0         |
        | Oct/Current Academic Year | 750          | 0          | 0         |
        | Nov/Current Academic Year | 750          | 0          | 0         |
        | Dec/Current Academic Year | 750          | 0          | 0         |
        | Jan/Current Academic Year | 750          | 0          | 0         |
        | Feb/Current Academic Year | 750          | 0          | 0         |
        | Mar/Current Academic Year | 750          | 0          | 0         |
        | Apr/Current Academic Year | 750          | 0          | 0         |
        | May/Current Academic Year | 750          | 0          | 0         |
        | Jun/Current Academic Year | 750          | 0          | 0         |
        | Jul/Current Academic Year | 750          | 0          | 0         |

    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 225                    | 25                          | 500               | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 225                    | 25                          | 500               | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 225                    | 25                          | 500               | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 225                    | 25                          | 500               | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 225                    | 25                          | 500               | Learning         |
        
    But the Provider now changes the Learner details as follows
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type        | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  |
        | learner a | 1        | start of academic year | 12 months        | 11250                | Aug/Current Academic Year           | Aug/Current Academic Year            | 3 months        | withdrawn         | .9                          | ContractWithEmployer | 1                   | ZPROG001      | 17            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract |  
		 
	When the amended ILR file is re-submitted for the learners in collection period R06/Current Academic Year

    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 750          | 0          | 0         |
        | Sep/Current Academic Year | 750          | 0          | 0         |
        | Oct/Current Academic Year | 750          | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |

    And the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R06/Current Academic Year | Nov/Current Academic Year | -750         | 0          | 0         |
        | R06/Current Academic Year | Dec/Current Academic Year | -750         | 0          | 0         |

    And the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R06/Current Academic Year | Nov/Current Academic Year | -225                   | -25                         | -500              | Learning         |
        | R06/Current Academic Year | Dec/Current Academic Year | -225                   | -25                         | -500              | Learning         |

    And at month end the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Levy Payments | Transaction Type |
        | R06/Current Academic Year | Nov/Current Academic Year | -225                   | -25                         | -500              | Learning         |
        | R06/Current Academic Year | Dec/Current Academic Year | -225                   | -25                         | -500              | Learning         |