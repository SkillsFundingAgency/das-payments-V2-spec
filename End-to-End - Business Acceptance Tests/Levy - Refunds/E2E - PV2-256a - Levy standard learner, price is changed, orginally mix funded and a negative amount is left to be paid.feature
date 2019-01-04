#Levy learner, price is changed, originally mix funded and a negative amount is left to be paid - results in a refund
#    
#    Given  the apprenticeship funding band maximum is 27000
#  
#    And the employer's levy balance is:
#        | 09/18 | 10/18 | 11/18 | 12/18 |
#        | 750   | 375   | 1000  | 1000  |
#        
#    And the following commitments exist:    
#        | commitment Id | version Id | Employer   | Provider   | ULN       | start date | end date   | status | agreed price | effective from | effective to | standard code | programme type |
#        | 1             | 1          | employer 0 | provider a | learner a | 01/08/2018 | 01/08/2019 | active | 11250        | 01/08/2018     | 03/10/2019   | 25            | 25             |
#        | 1             | 2          | employer 0 | provider a | learner a | 01/08/2018 | 01/08/2019 | active | 1400         | 04/10/2018     |              | 25            | 25             |
#    
#    When an ILR file is submitted on R01 with the following data:
#        | ULN       | learner type       | start date | planned end date | actual end date | completion status | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date | aim type  |  standard code | 
#        | learner a | programme only DAS | 04/08/2018 | 20/08/2019       |                 | continuing        | 9000                   | 04/08/2018                            | 2250                     | 04/08/2018                              | programme |  25            | 
#    
#    And an ILR file is submitted on R03 with the following data:
#        | ULN       | learner type       | start date | planned end date | actual end date | completion status | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date | Total training price 2 | Total training price 2 effective date | Total assessment price 2 | Total assessment price 2 effective date | aim type  | standard code |
#        | learner a | programme only DAS | 04/08/2018 | 20/08/2019       |                 | continuing        | 9000                   | 04/08/2018                            | 2250                     | 04/08/2018                              | 1200                   | 04/10/2018                            | 200                      | 04/10/2018                              | programme | 25            |
#    
#    
#Then the provider earnings break down as follows for each collection period:
#    
#        | Transaction Type               | R01  | R02  | R03 | R04 | ... | R12  | 
#        | Provider Earned Total          | 750  | 750  | -100| 0   | ... | 0    | 
#        | On-program                     | 0    | 0    | 0   | 0   | ... | 0    | 
#        | Completion                     | 0    | 0    | 0   | 0   | ... | 0    | 
#        | Balancing                      | 0    | 0    | 0   | 0   | ... | 0    | 
#        | Employer 16-18 incentive       | 0    | 0    | 0   | 0   | ... | 0    | 
#      
#    And the provider payments break down for each delivery period as follows:
#       
#        | Transaction Type               | R01  | R02  | R03  | R04 | ... | R12 |
#        | Provider Paid by SFA           | 750  |712.50| -100 | 0   | ... | 0   |
#        | Refund taken by SFA            | 0    | 0    | -95  | 0   | ... | 0   | 
#        | Payment due from Employer      | 0    |37.50 | 0    | 0   | ... | 0   |
#        | Refund due to employer         | 0    | 0    | 5    | 0   | ... | 0   |
#        | Levy account debited           | 750  | 750  | 0    | 0   | ... | 0   |
#        | Levy account credited          | 0    | 0    | 50   | 0   | ... | 0   | 
#        | SFA Levy employer budget       | 0    | 375  | 0    | 0   | ... | 0   |
#        | SFA Levy co-funding budget     | 0    |337.50| 0    | 0   | ... | 0   |


Scenario Outline: Levy standard learner, price is changed, orginally mix funded and a negative amount is left to be paid PV2-256a
	# levy balance > agreed price for all months
	Given The employers levy balance is : 
        | 09/18 | 10/18 | 11/18 | 12/18 |
        | 750   | 375   | 1000  | 1000  |
	# Commitment line
	And the following commitment exists
        | ULN       | priority | start date | end date   | agreed price | standard code | programme type |
        | learner a | 1        | 01/08/2018 | 01/08/2019 | 11250        | 25            | 25             |

	And the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 01/Aug/Current Academic Year | 12 months        | 11250                | 01/Aug/Current Academic Year        | continuing        | Act1          | 1                   | ZPROG001      | 25            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |

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

	# SFA Levy Payment
	# and levy acccount has been debited
    And the following provider payments had been generated and levy acccount has been debited
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 750               | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 750               | Learning         |

    But  The Commitment details are changed as follows
		| ULN       | priority | start date | end date   | agreed price | standard code | programme type |
		| learner a | 1        | 01/08/2018 | 01/08/2019 | 1400         | 25            | 25             |

    And  The Provider now changes the Learner details as follows
		| ULN       | Priority | Start Date             | Planned Duration | Actual Duration | Programme Type | Completion Status | SFA Contribution Percentage |
		| learner a | 1        | start of academic year | 12 months        | 12 months       | 25             | continuing        | 90%                         |

	And price details as follows
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date |
        | 1st price details | 9000                 | Aug/Current Academic Year           | 2250                  | Aug/Current Academic Year            |
        | 2nd price details | 1200                 | Oct/Current Academic Year           | 200                   | Oct/Current Academic Year            |

	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>

	Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 750          | 0          | 0         |
        | Sep/Current Academic Year | 750          | 0          | 0         |
        | Oct/Current Academic Year | -100         | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
        | Jun/Current Academic Year | 0            | 0          | 0         |
        | Jul/Current Academic Year | 0            | 0          | 0         |

	# SFA Levy Payment
	# and levy acccount has been debited
	And only the following provider payments will be recorded and levy acccount has been debited
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R03/Current Academic Year | Oct/Current Academic Year | -100         | 0          | 0         |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000              | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 3000              | Completion       |
Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
		| R04/Current Academic Year |