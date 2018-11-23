#Scenario: A non-DAS learner, learner withdraws after qualifying period
#    
#        When an ILR file is submitted with the following data:
#            | ULN       | agreed price | learner type           | start date | planned end date | actual end date | completion status |
#            | learner a | 15000        | programme only non-DAS | 01/09/2017 | 08/09/2018       | 08/01/2018      | withdrawn         |
#        Then the provider earnings and payments break down as follows:
#            | Type                          | 09/17 | 10/17 | 11/17 | 12/17 | 01/18 |
#            | Provider Earned Total         | 1000  | 1000  | 1000  | 1000  | 0     |
#            | Provider Earned from SFA      | 900   | 900   | 900   | 900   | 0     |
#            | Provider Earned from Employer | 100   | 100   | 100   | 100   | 0     |
#            | Provider Paid by SFA          | 0     | 900   | 900   | 900   | 900   |
#            | Payment due from Employer     | 0     | 100   | 100   | 100   | 100   |
#            | Levy account debited          | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy employer budget      | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     |
#            | SFA non-Levy co-funding budget| 900   | 900   | 900   | 900   | 0     |
#        And the transaction types for the payments are:
#            | Payment type             | 10/17 | 11/17 | 12/17 | 01/18 | 
#            | On-program               | 900   | 900   | 900   | 900   | 
#            | Completion               | 0     | 0     | 0     | 0     | 
#            | Balancing                | 0     | 0     | 0     | 0     | 
#            | Employer 16-18 incentive | 0     | 0     | 0     | 0     | 
#            | Provider 16-18 incentive | 0     | 0     | 0     | 0     | 

Scenario Outline: A non-levy learner withdraws after qualifying period PV2-277
	Given the provider is providing training for the following learners
		| ULN       | Priority | Start Date             | Planned Duration | Total Training Price | Total Assessment Price | Actual Duration | Programme Type | Completion Status | SFA Contribution Percentage |
		| learner a | 1        | start of academic year | 12 months        | 12000                | 3000                   | 4 months        | 25             | withdrawn         | 90%                         |
    When the ILR file is submitted for the learners for collection period <collection_period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 1000         | 0          | 0         |
		| Sep/Current Academic Year | 1000         | 0          | 0         |
		| Oct/Current Academic Year | 1000         | 0          | 0         |
		| Nov/Current Academic Year | 1000         | 0          | 0         |
		| Dec/Current Academic Year | 0            | 0          | 0         |
		| Jan/Current Academic Year | 0            | 0          | 0         |
		| Feb/Current Academic Year | 0            | 0          | 0         |
		| Mar/Current Academic Year | 0            | 0          | 0         |
		| Apr/Current Academic Year | 0            | 0          | 0         |
		| May/Current Academic Year | 0            | 0          | 0         |
		| Jun/Current Academic Year | 0            | 0          | 0         |
		| Jul/Current Academic Year | 0            | 0          | 0         |
    And the following payments will be calculated
		| Collection Period			| Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
		| R04/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 0            | 0          | 0         |
	And the following provider payments will be generated
		| Collection Period			| Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         |
		| R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         |
		| R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         |
		| R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         |
		| R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           |

	Examples:
		| collection_period			|
		| R01/Current Academic Year |
		| R02/Current Academic Year |
		| R03/Current Academic Year |
		| R04/Current Academic Year |
		| R05/Current Academic Year |