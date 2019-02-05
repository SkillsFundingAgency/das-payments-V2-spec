#Scenario: Non-Levy standard learner, payments made then price is changed retrospectively from beginning
#	
#    Given  the apprenticeship funding band maximum is 27000
#    
#	And levy balance > agreed price for all months
#	
#	And following learning has been recorded for previous payments:
#		| ULN       | employer   | provider   | learner type           | start date | aim sequence number | completion status | programme type | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date |
#		| learner a | employer 0 | provider A | programme only non-DAS | 04/08/2018 | 1                   | continuing        | 25             | 9000                   | 04/08/2018                            | 2250                     | 04/08/2018                              |
#
#	And the following earnings and payments have been made to the provider A for learner a:
#		| Type                           | 08/18 | 09/18 | 10/18 | 11/18 |
#		| Provider Earned Total          | 750   | 750   | 0     | 0     |
#		| Provider Earned from SFA       | 675   | 675   | 0     | 0     |
#		| Provider Earned from Employer  | 75    | 75    | 0     | 0     |
#		| Provider Paid by SFA           | 0     | 675   | 0     | 0     |
#		| Payment due from Employer      | 0     | 75    | 0     | 0     |
#		| Levy account debited           | 0     | 0     | 0     | 0     |
#		| SFA Levy employer budget       | 0     | 0     | 0     | 0     |
#		| SFA Levy co-funding budget     | 0     | 0     | 0     | 0     |
#		| SFA non-Levy co-funding budget | 675   | 675   | 0     | 0     |
#        
#    When an ILR file is submitted for the first time on 10/10/18 with the following data:
#        | ULN       | employer   | provider   | learner type           | start date | planned end date | agreed price | completion status | programme type | Total training price 1 | Total training price 1 effective date | Total assessment price 1 | Total assessment price 1 effective date |
#        | learner a | employer 0 | provider A | programme only non-DAS | 04/08/2018 | 20/08/2019       | 10            | continuing        | 25             | 8                      | 04/08/2018                            | 2                        | 04/08/2018                              |
#	
#    Then the provider earnings and payments break down as follows:
#        | Type                           | 08/18  | 09/18  | 10/18  | 11/18    | 12/18   |
#        | Provider Earned Total          | 0.66667 | 0.66667 | 0.66667 | 0.66667   | 0.66667  |
#        | Provider Earned from SFA       | 0.60   | 0.60   | 0.60   | 0.60     | 0.60    |
#        | Provider Earned from Employer  | 0.06667 | 0.06667 | 0.06667 | 0.06667   | 0.06667  |
#        | Provider Paid by SFA           | 0      | 675    | 675    | 0.60     | 0.60    |
#        | Refund taken by SFA            | 0      | 0      | 0      | -1348.80 | 0       |
#        | Payment due from Employer      | 0      | 75     | 75     | 0.06667   | 0.06667 |
#        | Refund due to employer         | 0      | 0      | 0      | -149.87  | 0       |
#        | Levy account debited           | 0      | 0      | 0      | 0        | 0       |
#        | Levy account credited          | 0      | 0      | 0      | 0        | 0       |
#        | SFA Levy employer budget       | 0      | 0      | 0      | 0        | 0       |
#        | SFA Levy co-funding budget     | 0      | 0      | 0      | 0        | 0       |
#        | SFA non-Levy co-funding budget | 0.60   | 0.60   | 0.60   | 0.60     | 0.60    |

Scenario Outline:  non-levy learner price changed retrospectively PV2-258
Non-Levy standard learner, payments made then price is changed retrospectively from beginning

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
        | ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Programme Type | Completion Status | SFA Contribution Percentage |
        | learner a | 1        | start of academic year | 12 months        | 8                    | Aug/Current Academic Year           | 2                     | Aug/Current Academic Year            | 12 months       | 25             | continuing        | 90%                         |
    When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 0.66667      | 0          | 0         |
        | Sep/Current Academic Year | 0.66667      | 0          | 0         |
        | Oct/Current Academic Year | 0.66667      | 0          | 0         |
        | Nov/Current Academic Year | 0.66667      | 0          | 0         |
        | Dec/Current Academic Year | 0.66667      | 0          | 0         |
        | Jan/Current Academic Year | 0.66667      | 0          | 0         |
        | Feb/Current Academic Year | 0.66667      | 0          | 0         |
        | Mar/Current Academic Year | 0.66667      | 0          | 0         |
        | Apr/Current Academic Year | 0.66667      | 0          | 0         |
        | May/Current Academic Year | 0.66667      | 0          | 0         |
        | Jun/Current Academic Year | 0.66667      | 0          | 0         |
        | Jul/Current Academic Year | 0.66667      | 0          | 0         |
    And the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R03/Current Academic Year | Aug/Current Academic Year | -749.33333   | 0          | 0         |
        | R03/Current Academic Year | Sep/Current Academic Year | -749.33333   | 0          | 0         |
        | R03/Current Academic Year | Oct/Current Academic Year | 0.66667      | 0          | 0         |
        | R04/Current Academic Year | Nov/Current Academic Year | 0.66667      | 0          | 0         |
        | R05/Current Academic Year | Dec/Current Academic Year | 0.66667      | 0          | 0         |
        | R06/Current Academic Year | Jan/Current Academic Year | 0.66667      | 0          | 0         |
        | R07/Current Academic Year | Feb/Current Academic Year | 0.66667      | 0          | 0         |
        | R08/Current Academic Year | Mar/Current Academic Year | 0.66667      | 0          | 0         |
        | R09/Current Academic Year | Apr/Current Academic Year | 0.66667      | 0          | 0         |
        | R10/Current Academic Year | May/Current Academic Year | 0.66667      | 0          | 0         |
        | R11/Current Academic Year | Jun/Current Academic Year | 0.66667      | 0          | 0         |
        | R12/Current Academic Year | Jul/Current Academic Year | 0.66667      | 0          | 0         |
    And the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |
        | R03/Current Academic Year | Aug/Current Academic Year | -674.40                | -74.93333                   |
        | R03/Current Academic Year | Sep/Current Academic Year | -674.40                | -74.93333                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 0.60                   | 0.06667                     |
        | R04/Current Academic Year | Nov/Current Academic Year | 0.60                   | 0.06667                     |
        | R05/Current Academic Year | Dec/Current Academic Year | 0.60                   | 0.06667                     |
        | R06/Current Academic Year | Jan/Current Academic Year | 0.60                   | 0.06667                     |
        | R07/Current Academic Year | Feb/Current Academic Year | 0.60                   | 0.06667                     |
        | R08/Current Academic Year | Mar/Current Academic Year | 0.60                   | 0.06667                     |
        | R09/Current Academic Year | Apr/Current Academic Year | 0.60                   | 0.06667                     |
        | R10/Current Academic Year | May/Current Academic Year | 0.60                   | 0.06667                     |
        | R11/Current Academic Year | Jun/Current Academic Year | 0.60                   | 0.06667                     |
        | R12/Current Academic Year | Jul/Current Academic Year | 0.60                   | 0.06667                     |

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