#Scenario:Non-Levy standard learner, price is changed and a negative amount is left to be paid - results in a refund
    #
    #Given the apprenticeship funding band maximum is 27000
    #
    #When an ILR file is submitted on R01 with the following data:
    #    | ULN       | learner type           | start date | planned end date | actual end date | completion status | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date | aim sequence number | aim type  | standard code | programme type |
    #    | learner a | programme only non-DAS | 04/08/2018 | 20/08/2019       |                 | continuing        | 9000                   | 04/08/2018                            | 2250                     | 04/08/2018                              | 1                   | programme | 25            | 25             |
    #
    #
    #And an ILR file is submitted at R03 with the following data:
    #
    #    | ULN       | learner type           | start date | planned end date | actual end date | completion status | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date | Total training price 2 | Total training price 2 effective date | Total assessment price 2 | Total assessment price 2 effective date | aim sequence number | aim type  | standard code | programme type |
    #    | learner a | programme only non-DAS | 04/08/2018 | 20/08/2019       |                 | continuing        | 9000                   | 04/08/2018                            | 2250                     | 04/08/2018                              | 1200                   | 04/10/2018                            | 200                      | 04/10/2018                              | 1                   | programme | 25            | 25             |
    #
    #Then the provider earnings break down as follows for each collection period:
    #
    #    | Transaction Type               | R01 | R02 | R03 | R04 | ... | R12 | 
    #    | Provider Earned Total          | 750 | 750 | -100| 0   | ... | 0   | 
    #    | On-program                     | 675 | 675 | 0   | 0   | ... | 0   | 
    #    | Completion                     | 0   | 0   | 0   | 0   | ... | 0   | 
    #    | Balancing                      | 0   | 0   | 0   | 0   | ... | 0   | 
    #    | Employer 16-18 incentive       | 0   | 0   | 0   | 0   | ... | 0   | 
    #  
    #And the provider payments break down for each delivery period as follows:
    #   
    #    | Transaction Type               | R01 | R02 | R03 | R04 | ... | R12 |
    #    | Provider Paid by SFA           | 675 | 675 | 0   | 0   | ... | 0   |
    #    | Refund taken by SFA            | 0   | 0   | -90 | 0   | ... | 0   | 
    #    | Payment due from Employer      | 75  | 75  | 0   | 0   | ... | 0   |
    #    | Refund due to employer         | 0   | 0   | -10 | 0   | ... | 0   |
    #    | Levy account debited           | 0   | 0   | 0   | 0   | ... | 0   |
    #    | Levy account credited          | 0   | 0   | 0   | 0   | ... | 0   | 
    #    | SFA Levy employer budget       | 0   | 0   | 0   | 0   | ... | 0   |
    #    | SFA Levy co-funding budget     | 0   | 0   | 0   | 0   | ... | 0   |

Scenario Outline: Non-Levy standard learner, price is changed and a negative amount is left to be paid - results in a refund PV2-255
    Given the provider previously submitted the following learner details
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Programme Type | Completion Status | SFA Contribution Percentage |
        | learner a | 1        | start of academic year | 12 months        | 9000                 | Aug/Current Academic Year           | 2250                  | Aug/Current Academic Year            | 12 months       | 25             | continuing        | 90%                         |
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
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |
        | R01/Current Academic Year | Aug/Current Academic Year | 675                    | 75                          |
        | R02/Current Academic Year | Sep/Current Academic Year | 675                    | 75                          |

    But the Provider now changes the Learner details as follows
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
    And the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R03/Current Academic Year | Oct/Current Academic Year | -100         | 0          | 0         |
	And no payments will be calculated for following collection periods
		| Collection Period         |
		| R04/Current Academic Year |
		| R05/Current Academic Year |
		| R06/Current Academic Year |
		| R07/Current Academic Year |
		| R08/Current Academic Year |
		| R09/Current Academic Year |
		| R10/Current Academic Year |
		| R11/Current Academic Year |
		| R12/Current Academic Year |
    And the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |
        | R03/Current Academic Year | Oct/Current Academic Year | -90                    | -10                         |

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