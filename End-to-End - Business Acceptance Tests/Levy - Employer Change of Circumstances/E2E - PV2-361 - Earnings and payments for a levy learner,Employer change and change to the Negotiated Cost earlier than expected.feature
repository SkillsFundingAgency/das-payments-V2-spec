  #Scenario: Earnings and payments for a levy learner, levy available, and there is a change to the Negotiated Cost earlier than expected
  #      Given The learner is programme only DAS
  #      And the employer 1 has a levy balance > agreed price for all months
  #      And the employer 2 has a levy balance > agreed price for all months
  #      
  #      And the learner changes employers
  #          | Employer   | Type | ILR employment start date |
  #          | employer 1 | DAS  | 04/08/2018                |
  #          | employer 2 | DAS  | 10/11/2018                |
  #      
  #      And the following commitments exist on 03/12/2018:
  #          | Employer   | commitment Id | version Id | ULN       | start date | end date   | agreed price | status    | effective from | effective to | stop effective from |
  #          | employer 1 | 1             | 1-001      | learner a | 01/08/2018 | 31/08/2019 | 15000        | cancelled | 01/08/2018     | 31/10/2018   | 01/11/2018   |
  #          | employer 2 | 2             | 1-001      | learner a | 01/11/2018 | 31/08/2019 | 5625         | active    | 01/11/2018     |              |              |
  #      
  #      When an ILR file is submitted on 03/12/2018 with the following data:
  #          | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | Residual training price | Residual training price effective date | Residual assessment price | Residual assessment price effective date |
  #          | learner a | 04/08/2018 | 04/08/2019       |                 | continuing        | 12000                | 04/08/2018                          | 3000                   | 04/08/2018                            | 5000                    | 25/10/2018                             | 625                       | 25/10/2018                               |
  #      
  #      #Then the data lock status of the ILR in 03/12/2018 is:
  #      #    | Payment type | 08/18               | 09/18               | 10/18 | 11/18 | 12/18 |
  #      #    | On-program   | commitment 1 v1-001 | commitment 1 v1-001 |       |       |       |
  #      
  #      Then the provider earnings and payments break down as follows:
  #          | Type                            | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
  #          | Provider Earned Total           | 1000  | 1000  | 450   | 450   | 450   |
  #          | Provider Earned from SFA        | 1000  | 1000  | 450   | 450   | 450   |
  #          | Provider Earned from Employer 1 | 0     | 0     | 0     | 0     | 0     |
  #          | Provider Earned from Employer 2 | 0     | 0     | 0     | 0     | 0     |
  #          | Provider Paid by SFA            | 0     | 1000  | 1000  | 0     | 0     |
  #          | Payment due from employer 1     | 0     | 0     | 0     | 0     | 0     |
  #          | Payment due from employer 2     | 0     | 0     | 0     | 0     | 0     |
  #          | Employer 1 Levy account debited | 0     | 1000  | 1000  | 0     | 0     |
  #          | Employer 2 Levy account debited | 0     | 0     | 0     | 0     | 0     |
  #          | SFA Levy employer budget        | 1000  | 1000  | 0     | 0     | 0     |
  #          | SFA Levy co-funding budget      | 0     | 0     | 0     | 0     | 0     |

 Scenario Outline: Levy learner changes employer with change to negotiated price in mid month PV2-363
	# levy balance is enough for both employers
	Given the "employer 1" levy account balance in collection period <Collection_Period> is <Levy Balance for employer 1>
	And  the "employer 2" levy account balance in collection period <Collection_Period> is <Levy Balance for employer 2>
	# Date added in the end
	And the following commitments exist on "03/Dec/Current Academic Year"
	# Additional fields
        | Employer   | commitment Id | version Id | ULN       | start date                   | end date                     | agreed price | status    | effective from               | effective to                 | stop effective from          |
        | employer 1 | 1             | 1-001      | learner a | 01/Aug/Current Academic Year | 31/Jul/Current Academic Year | 15000        | cancelled | 01/Aug/Current Academic Year | 31/Oct/Current Academic Year | 01/Nov/Current Academic Year |
        | employer 2 | 2             | 1-001      | learner a | 01/Nov/Current Academic Year | 31/Jul/Current Academic Year | 5625         | active    | 01/Nov/Current Academic Year |                              |                              |
	And the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  |
		| 01/Aug/Current Academic Year | 12 months        | 12000                | 01/Aug/Current Academic Year        | 3000                   | 01/Aug/Current Academic Year          |                 | continuing        | 90%                         | Act1          | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract |
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
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000          | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000          | Learning         |
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Employer 1 Applicable Date   | Employer 2 Applicable Date   | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 01/Aug/Current Academic Year | 12 months        | 04/Aug/Current Academic Year | 10/Nov/Current Academic Year |                 | continuing        | Act1          | 1                   | ZPROG001      | 51            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |  
	And price details as follows
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date |
        | 1st price details | 12000                | 01/Aug/Current Academic Year        | 3000                   | 01/Aug/Current Academic Year          | 0                       |                                        | 0                         |                                          |
        | 2nd price details | 0                    |                                     | 0                      |                                       | 5000                    | 25/Oct/Current Academic Year           | 625                       | 25/Oct/Current Academic Year             |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 450          | 0          | 0         |
        | Dec/Current Academic Year | 450          | 0          | 0         |
        | Jan/Current Academic Year | 450          | 0          | 0         |
        | Feb/Current Academic Year | 450          | 0          | 0         |
        | Mar/Current Academic Year | 450          | 0          | 0         |
        | Apr/Current Academic Year | 450          | 0          | 0         |
        | May/Current Academic Year | 450          | 0          | 0         |
        | Jun/Current Academic Year | 450          | 0          | 0         |
        | Jul/Current Academic Year | 450          | 0          | 0         |

    And at month end no payments will be calculated 
 	And no provider payments will be recorded
	And no provider payments will be generated

Examples: 
        | Collection_Period         | Levy Balance for employer 1 | Levy Balance for employer 2 |
        | R01/Current Academic Year | 15500                       | 7500                        |
        | R02/Current Academic Year | 14500                       | 7500                        |
        | R03/Current Academic Year | 13500                       | 7500                        |
        | R04/Current Academic Year | 13500                       | 7500                        |
