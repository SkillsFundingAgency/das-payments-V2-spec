#Non-Levy learner, changes standard, negotiated price remains the same	
#
#Feature: Provider earnings and payments where learner changes apprenticeship standard and negotiated price remains the same, (remaining with the same employer and provider)
#
#    Background:
#	
#        Given The learner is programme only non-DAS
#        And the apprenticeship funding band maximum is 17000
# 
#		When an ILR file is submitted with the following data:
#            | ULN       | standard code | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#            | learner a | 51            | 03/08/2018 | 01/08/2019       | 31/10/2018      | withdrawn         | 12000                | 03/08/2018                          | 3000                   | 03/08/2018                            |
#            | learner a | 52            | 03/11/2018 | 01/08/2019       |                 | continuing        | 12000                | 03/11/2018                          | 3000                   | 03/11/2018                            |
#       		
#		Then the provider earnings and payments break down as follows:
#		
#            | Type                       		| 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
#            | Provider Earned Total      		| 1000  | 1000  | 1000  | 1000  | 1000  |
#            | Provider Earned from SFA   		| 900   |  900  |  900  | 900   | 900   |
#            | Provider Earned from Employer 	| 100   |  100  |  100  | 100   | 100   |            
#			| Provider Paid by SFA       		| 0     |  900  |  900  | 900   | 900   |
#            | Payment due from Employer         | 0     |  100  |  100  | 100   | 100   | 
#			| Levy account debited       		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy employer budget   		| 0     |    0  |    0  | 0     | 0     |
#            | SFA Levy co-funding budget 		| 0     |    0  |    0  | 0     | 0     |
#			| SFA non-Levy co-funding budget	| 900   |  900  |  900  | 900   | 900   |  

Feature: Provider earnings and payments where learner changes apprenticeship standard and negotiated price remains the same, (remaining with the same employer and provider)
	As a provider,
	I want a non-levy learner, changes apprenticeship standard and the negotiated price remains the same, to be paid the correct amount
	So that I am accurately paid my apprenticeship provision.
	
Scenario Outline: Non-levy learner changes standard with no change to negotiated price PV2-207
	# the provider changes the Standard Type to 52 effective from 03/Nov/Current Academic Year
    Given the following learners
		| Learner Reference Number | Uln      |
		| abc123                   | 12345678 |
	And the following aims
		| Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status |
		| ZPROG001      | 03/Aug/Current Academic Year | 12 months        | 3 months        | 1                   | 25             | 51            | 16-18 Apprenticeship Non-Levy | withdrawn         |
		| ZPROG001      | 03/Nov/Current Academic Year | 9 months         |                 | 2                   | 25             | 52            | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows		
        | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   | 90%                         |
        | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          | Act2          | 2                   | 90%                         |

    When the ILR file is submitted for the learners for collection period <Collection_Period>
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
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
		| R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         |
		| R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
		| R04/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 1000         | 0          | 0         |
		| R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         |
		| R07/Current Academic Year | Feb/Current Academic Year | 1000         | 0          | 0         |
		| R08/Current Academic Year | Mar/Current Academic Year | 1000         | 0          | 0         |
		| R09/Current Academic Year | Apr/Current Academic Year | 1000         | 0          | 0         |
		| R10/Current Academic Year | May/Current Academic Year | 1000         | 0          | 0         |
		| R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         |
		| R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | Learning         |
        | R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         |
        | R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         |
        | R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         |
        | R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Standard Code |
		| R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         | 51            |
		| R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         | 51            |
		| R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         | 51            |
		| R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | Learning         | 52            |
		| R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | Learning         | 52            |
	Examples:
		| Collection_Period         |
		| R01/Current Academic Year |
		| R02/Current Academic Year |
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