#Scenario: Apprentice changes provider but remains with the same employer, and there is a gap between the two learning spells
#        Given The learner is programme only DAS
#        And levy balance > agreed price for all months
#		And the apprenticeship funding band maximum is 15000
#        And the following commitments exist:
#            | commitment Id | version Id | Provider   | start date | end date   | agreed price | status    | effective from | effective to | stop effective from |
#            | 1             | 1          | provider a | 01/08/2018 | 01/08/2019 | 7500         | cancelled | 01/08/2018     | 04/03/2019   | 05/03/2019   |
#            | 2             | 1          | provider b | 01/06/2019 | 01/11/2019 | 4500         | active    | 06/06/2019     |              |              |
#        
#        When the providers submit the following ILR files:
#            | Provider   | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#            | provider a | learner a | 06/08/2018 | 08/08/2019       | 04/03/2019      | withdrawn         | 6000                 | 06/08/2018                          | 1500                   | 06/08/2018                            |
#            | provider b | learner a | 06/06/2019 | 20/11/2019       |                 | continuing        | 3000                 | 06/06/2019                          | 1500                   | 06/06/2019                            |
#        
#        #Then the data lock status will be as follows:
#        #    | Payment type | 08/18               | 09/18               | 10/18               | ... | 02/19               | 03/19 | 04/19 | 05/19 | 06/19               | 07/19               | 08/19               | 09/19               | 10/19               | 
#        #    | On-program   | commitment 1 v1-001 | commitment 1 v1-001 | commitment 1 v1-001 | ... | commitment 1 v1-001 |       |       |       | commitment 2 v2-001 | commitment 2 v2-001 | commitment 2 v2-001 | commitment 2 v2-001 | commitment 2 v2-001 | 
#        
#        Then OBSOLETE - the earnings and payments break down for provider a is as follows:
#            | Type                           | 08/18 | 09/18 | 10/18 | ... | 02/19 | 03/19 | 04/19 | ... | 11/19 |
#            | Provider Earned Total          | 500   | 500   | 500   | ... | 500   | 0     | 0     | ... | 0     |
#            | Provider Earned from SFA       | 500   | 500   | 500   | ... | 500   | 0     | 0     | ... | 0     |
#            | Provider Earned from Employer  | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | Provider Paid by SFA           | 0     | 500   | 500   | ... | 500   | 500   | 0     | ... | 0     |
#            | Payment due from Employer      | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | Levy account debited           | 0     | 500   | 500   | ... | 500   | 500   | 0     | ... | 0     |
#            | SFA Levy employer budget       | 500   | 500   | 500   | ... | 500   | 0     | 0     | ... | 0     |
#            | SFA Levy co-funding budget     | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#            | SFA non-Levy co-funding budget | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     |
#        
#        And OBSOLETE - the earnings and payments break down for provider b is as follows:
#            | Type                           | 08/18 | ... | 06/19 | 07/19 | 08/19 | 09/19 | 10/19 | 11/19 |
#            | Provider Earned Total          | 0     | ... | 720   | 720   | 720   | 720   | 720   | 0     |
#            | Provider Earned from SFA       | 0     | ... | 720   | 720   | 720   | 720   | 720   | 0     |
#            | Provider Earned from Employer  | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | Provider Paid by SFA           | 0     | ... | 0     | 720   | 720   | 720   | 720   | 720   |
#            | Payment due from Employer      | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | Levy account debited           | 0     | ... | 0     | 720   | 720   | 720   | 720   | 720   |
#            | SFA Levy employer budget       | 0     | ... | 720   | 720   | 720   | 720   | 720   | 0     |
#            | SFA Levy co-funding budget     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |
#            | SFA non-Levy co-funding budget | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     |

Feature: Apprentice changes provider but remains with the same employer, and there is a gap between the two learning spells
	As a provider,
	I want a levy learner, that changes provider but remains with the same employer and there is a gap between the two learning spells, to be paid the correct amount
	So that I am accurately paid my apprenticeship provision.

Scenario Outline: Levy learner changes provider but remains with the same employer and there is a gap PV2-319
	Given the employer levy account balance in collection period <Collection_Period> is <Levy Balance>
	And the following commitments exist
        | commitment Id | version Id | Provider   | Learner ID | start date                   | end date                  | agreed price | status    | effective from               | effective to                 | stop effective from          |
        | 1             | 1-001      | provider a | learner a  | 01/Aug/Current Academic Year | 01/Aug/Next Academic Year | 7500         | cancelled | 01/Aug/Current Academic Year | 04/Mar/Current Academic Year | 05/Mar/Current Academic Year |
        | 2             | 1-001      | provider b | learner a  | 01/Jun/Current Academic Year | 01/Nov/Next Academic Year | 4500         | active    | 06/Jun/Current Academic Year |                              |                              |
	And the "provider a" previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 6000                 | 06/Aug/Current Academic Year        | 1500                   | 06/Aug/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 51            | 25             | 19-24 Apprenticeship (From May 2017) Levy Contract | 90%                         |
    And the following earnings had been generated for the learner for "provider a"
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 500          | 0          | 0         |
        | Sep/Current Academic Year | 500          | 0          | 0         |
        | Oct/Current Academic Year | 500          | 0          | 0         |
        | Nov/Current Academic Year | 500          | 0          | 0         |
        | Dec/Current Academic Year | 500          | 0          | 0         |
        | Jan/Current Academic Year | 500          | 0          | 0         |
        | Feb/Current Academic Year | 500          | 0          | 0         |
        | Mar/Current Academic Year | 500          | 0          | 0         |
        | Apr/Current Academic Year | 500          | 0          | 0         |
        | May/Current Academic Year | 500          | 0          | 0         |
        | Jun/Current Academic Year | 500          | 0          | 0         |
        | Jul/Current Academic Year | 500          | 0          | 0         |
    And the following "provider a" payments had been generated
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 500           | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 500           | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 500           | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 500           | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 500           | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 500           | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 500           | Learning         |
    But the "provider a" now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 6000                 | 06/Aug/Current Academic Year        | 1500                   | 06/Aug/Current Academic Year          | 7 months        | withdrawn         | Act1          | 1                   | ZPROG001      | 51            | 25             | 19-24 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	# New
	And the "provider b" is providing training for the following learners
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | Funding Line Type                                  | SFA Contribution Percentage |
		| 06/Jun/Current Academic Year | 5 months         | 3000                 | 06/Jun/Current Academic Year        | 1500                   | 06/Jun/Current Academic Year          |                 | continuing        | Act1          | 1                   | ZPROG001      | 51            | 25             | 19-24 Apprenticeship (From May 2017) Levy Contract | 90%                         |
	# one resubmit and another first submission
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period> by "provider a"
	When the ILR file is submitted for the learners for collection period <Collection_Period> by "provider b"
	Then the following learner earnings should be generated for "provider a"
		| Delivery Period           | On-Programme | Completion | Balancing |
		| Aug/Current Academic Year | 500          | 0          | 0         |
		| Sep/Current Academic Year | 500          | 0          | 0         |
		| Oct/Current Academic Year | 500          | 0          | 0         |
		| Nov/Current Academic Year | 500          | 0          | 0         |
		| Dec/Current Academic Year | 500          | 0          | 0         |
		| Jan/Current Academic Year | 500          | 0          | 0         |
		| Feb/Current Academic Year | 500          | 0          | 0         |
		# changed provider
		| Mar/Current Academic Year | 0            | 0          | 0         |
		| Apr/Current Academic Year | 0            | 0          | 0         |
		| May/Current Academic Year | 0            | 0          | 0         |
		| Jun/Current Academic Year | 0            | 0          | 0         |
		| Jul/Current Academic Year | 0            | 0          | 0         |
	And the following learner earnings should be generated for "provider b"
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 0            | 0          | 0         |
        | Sep/Current Academic Year | 0            | 0          | 0         |
        | Oct/Current Academic Year | 0            | 0          | 0         |
        | Nov/Current Academic Year | 0            | 0          | 0         |
        | Dec/Current Academic Year | 0            | 0          | 0         |
        | Jan/Current Academic Year | 0            | 0          | 0         |
        | Feb/Current Academic Year | 0            | 0          | 0         |
		# 3 months gap
        | Mar/Current Academic Year | 0            | 0          | 0         |
        | Apr/Current Academic Year | 0            | 0          | 0         |
        | May/Current Academic Year | 0            | 0          | 0         |
		# "provider b"
        | Jun/Current Academic Year | 720          | 0          | 0         |
        | Jul/Current Academic Year | 720          | 0          | 0         |
	# New
    And at month end no payments will be calculated for "provider a"
    And at month end only the following payments will be calculated for "provider b"
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R11/Current Academic Year | Jun/Current Academic Year | 720          | 0          | 0         |
        | R12/Current Academic Year | Jul/Current Academic Year | 720          | 0          | 0         |
	# New
	And no "provider a" payments will be recorded        
	And only the following "provider b" payments will be recorded
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
		| R11/Current Academic Year | Jun/Current Academic Year | 720           | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 720           | Learning         |        
	# New
	And no "provider a" payments will be generated
	And only the following "provider b" payments will be generated
        | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
		| R11/Current Academic Year | Jun/Current Academic Year | 720           | Learning         |
		| R12/Current Academic Year | Jul/Current Academic Year | 720           | Learning         |        
Examples: 
        | Collection_Period         | Levy Balance |
        | R01/Current Academic Year | 12500        |
        | R02/Current Academic Year | 12000        |
        | R03/Current Academic Year | 11500        |
        | R04/Current Academic Year | 10000        |
        | R05/Current Academic Year | 9500         |
        | R06/Current Academic Year | 9000         |
        | R07/Current Academic Year | 8500         |
        | R08/Current Academic Year | 8000         |
        | R09/Current Academic Year | 8000         |
        | R10/Current Academic Year | 8000         |
        | R11/Current Academic Year | 8000         |
        | R12/Current Academic Year | 7280         |