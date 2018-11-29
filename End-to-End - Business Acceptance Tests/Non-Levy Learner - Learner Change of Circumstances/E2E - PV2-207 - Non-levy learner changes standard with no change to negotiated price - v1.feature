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

Scenario Outline: Non-levy learner changes standard with no change to negotiated price PV2-207
    Given the provider is providing training for the following learners
		#Deleted Prioriry
		#Added ULN and LearnerRefNumber
        | ULN    | LearnerRefNumber | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
        | 123456 | ABC123456        | 03/Aug/Current Academic Year | 12 months        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | 3 months        | withdrawan        | Act2          | 1                   | ZPROG001      | 25             | 51            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
        | 123456 | ABC123456        | 03/Nov/Current Academic Year | 9 months         | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 25             | 52            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And price details as follows
        | Price Episode Identifier | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Standard Code | Start Date |
        | PriceEpisodeIdentifier 1 | 12000                | Aug/Current Academic Year           | 3000                  | Aug/Current Academic Year            | 51            | 03/Aug/Current Academic Year |
        | PriceEpisodeIdentifier 2 | 12000                | Nov/Current Academic Year           | 3000                  | Nov/Current Academic Year            | 52            | 03/Nov/Current Academic Year |
    When the ILR file is submitted for the learners for collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Price Identifier         | Delivery Period           | On-Programme | Completion | Balancing |
        | PriceEpisodeIdentifier 1 | Aug/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 1 | Sep/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 1 | Oct/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Nov/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Dec/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Jan/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Feb/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Mar/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Apr/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | May/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Jun/Current Academic Year | 1000         | 0          | 0         |
        | PriceEpisodeIdentifier 2 | Jul/Current Academic Year | 1000         | 0          | 0         |
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