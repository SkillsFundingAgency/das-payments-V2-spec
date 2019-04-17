#Scenario: DLOCK11 - When employer is not a levy payer, DLOCK11 will be raised
#
#    Given the employer is not a levy payer
#    And the following commitments exist:
#        | commitment Id | version Id | Provider   | ULN       | framework code | programme type | pathway code | agreed price | start date | end date   | status | effective from |
#        | 73            | 73-125     | Provider a | learner a | 450            | 2              | 1            | 10000        | 01/05/2018 | 01/05/2019 | active | 01/05/2018     |
#        
#    When an ILR file is submitted with the following data:  
#        | Provider   | ULN       | framework code | programme type | pathway code | start date | planned end date | completion status | Total training price | Total training price effective date |
#        | Provider a | learner a | 450            | 2              | 1            | 01/05/2018 | 08/08/2019       | continuing        | 10000                | 01/05/2018                          |
#    
#    Then the following data lock event is returned:
#        | Price Episode identifier  | Apprenticeship Id | ULN       | ILR Start Date | ILR Training Price | 
#        | 2-450-1-01/05/2018        | 73                | learner a | 01/05/2018     | 10000              |
#    And the data lock event has the following errors:    
#        | Price Episode identifier | Error code | Error Description                          |
#        | 2-450-1-01/05/2018       | DLOCK_11   | The employer is not currently a levy payer |
#    And the data lock event has the following periods    
#        | Price Episode identifier | Period   | Payable Flag | Transaction Type |
#        | 2-450-1-01/05/2018       | 1718-R10 | false        | Learning         |
#        | 2-450-1-01/05/2018       | 1718-R11 | false        | Learning         |
#        | 2-450-1-01/05/2018       | 1718-R12 | false        | Learning         |
#    And the data lock event used the following commitments   
#        | Price Episode identifier | Apprentice Version | Start Date | framework code | programme type | pathway code | Negotiated Price | Effective Date |
#        | 2-450-1-01/05/2018       | 73-125             | 01/05/2018 | 450            | 2              | 1            | 10000            | 01/05/2018     |

		Feature:Datalocks
		As a Provider,
		I want to be notified with a DLOCK11 when Employer is not a Levy payer
		So that I can take the correct action to get paid for my learner

		Scenario: DLOCK11 - When the employer is not a levy payer then datalock DLOCK_11 will be produced
		#New step to check if the employer is a levy payer. 
		Given the following employer exists
		| Employer   | IsLevyPayer |
		| employer a | 0           |
		
		And the following apprenticeship exists
		| Employer   | Apprenticeship   | framework code | programme type | pathway code | start date                   | end date                  | status |
		| employer a | apprenticeship a | 593            | 20             | 1            | 01/May/Current Academic Year | 31/May/Next Academic Year | active |

		And the apprenticeship has the following apprenticeship price episode periods
		| Apprenticeship   | agreed price | effective from               | effective to |
		| apprenticeship a | 10000        | 01/May/Current Academic Year |              |

		
		And the provider is providing training for the following learners
		| Learner ID | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | framework code | programme type | pathway code | Completion Status | Contract |
		| learner a  | 01/May/Current Academic Year | 12 months        | 10000                | 01/May/Current Academic Year        |                        |                                       |                 | 593            | 20             | 1            | continuing        | Act1     |

			
		When the ILR file is submitted for the learners for collection period "R12/Current Academic Year"

		Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 0            | 0          | 0         |
		| Sep/Current Academic Year | 0            | 0          | 0         |
		| Oct/Current Academic Year | 0            | 0          | 0         |
		| Nov/Current Academic Year | 0            | 0          | 0         |
		| Dec/Current Academic Year | 0            | 0          | 0         |
		| Jan/Current Academic Year | 0            | 0          | 0         |
		| Feb/Current Academic Year | 0            | 0          | 0         |
		| Mar/Current Academic Year | 0            | 0          | 0         |
		| Apr/Current Academic Year | 0            | 0          | 0         |
		| May/Current Academic Year | 666.67       | 0          | 0         |
		| Jun/Current Academic Year | 666.67       | 0          | 0         |
		| Jul/Current Academic Year | 666.67       | 0          | 0         |

	# New step
    And the following non-payable earnings were generated
        | Learner ID | ILR Start Date               | Standard code | programme type |
        | learner a  | 01/May/Current Academic Year | 17            | 25             |

    And the following data lock failures were generated
        | Apprentice   | Learner ID | ILR Start Date               | Delivery Period           | Transaction Type | Error Description |
        | apprentice a | learner a  | 01/May/Current Academic Year | May/Current Academic Year | Learning         | DLOCK 11          |
				

	And Month end is triggered

	And no provider payments will be recorded

	And no provider payments will be generated
