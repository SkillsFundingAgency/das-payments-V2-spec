
#Issues in Spec:
# 09/19 is incorrect
#
#Scenario: ILR submitted late for a non-DAS learner
#		
#Given the apprenticeship funding band maximum for each learner is 17000
#When a provider submits an ILR several months after learning has started (after the academic year boundary), 
#the earnings calculation is updated retrospectively and the provider gets paid for the preceding months.
#	 
#		When an ILR file is submitted for the first time on 28/08/19 with the following data:
#		
#            | ULN       | learner type       | agreed price | start date | planned end date | completion status |
#            | learner a | programme only DAS | 15000        | 01/09/2018 | 08/09/2019       | continuing        |
#       
#	   Then the provider earnings and payments break down as follows:
#	   
#            | Type                          			|09/18| ... | 04/19 | 05/19 | 06/19 | 07/19 | 08/19 | 09/19 | 
#            | Provider Earned Total         			|1000 | ... | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  | 
#            | Provider Earned from SFA      			|900  | ... | 900   | 900   | 900   | 900   |  900  |  900  | 
#            | Provider Paid by SFA          			|  0  | ... | 0     | 0     | 0     | 0     | 9900  |    0  | 
#            | Payment due from Employer     			|100  | ... | 100   | 100   | 100   | 100   | 1100  |  100	| 	                          
#			| Levy account debited          			|  0  | ... | 0     | 0     | 0     | 0     |   0   |    0  | 
#            | SFA Levy employer budget      			|  0  | ... | 0     | 0     | 0     | 0     |   0   |    0  | 
#            | SFA Levy co-funding budget    			|  0  | ... | 0     | 0     | 0     | 0     |   0   |    0  | 			
#            | SFA non-Levy co-funding budget			| 900 | ... | 900   | 900   | 900   | 900   | 9900  |  900  | 


#Notes: R13 collection period

Scenario: ILR submitted first time in R13 or R14 for a non-DAS learner ILR PV2-427
    Given the provider is providing training for the following learners
        | Priority | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
        | 1        | 01/Sep/Last Academic Year | 12 months        | 15000                | 01/Sep/Last Academic Year           | 0                      | 01/Sep/Last Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the ILR file is submitted for the learners for collection period "R13/Last Academic Year"
	Then the following learner earnings should be generated
        | Delivery Period        | On-Programme | Completion | Balancing |
        | Aug/Last Academic Year | 0            | 0          | 0         |
        | Sep/Last Academic Year | 1000         | 0          | 0         |
        | Oct/Last Academic Year | 1000         | 0          | 0         |
        | Nov/Last Academic Year | 1000         | 0          | 0         |
        | Dec/Last Academic Year | 1000         | 0          | 0         |
        | Jan/Last Academic Year | 1000         | 0          | 0         |
        | Feb/Last Academic Year | 1000         | 0          | 0         |
        | Mar/Last Academic Year | 1000         | 0          | 0         |
        | Apr/Last Academic Year | 1000         | 0          | 0         |
        | May/Last Academic Year | 1000         | 0          | 0         |
        | Jun/Last Academic Year | 1000         | 0          | 0         |
        | Jul/Last Academic Year | 1000         | 0          | 0         |
    And only the following payments will be calculated
        | Collection Period      | Delivery Period        | On-Programme | Completion | Balancing |
        | R13/Last Academic Year | Sep/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Oct/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Nov/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Dec/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Jan/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Feb/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Mar/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Apr/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | May/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Jun/Last Academic Year | 1000         | 0          | 0         |
        | R13/Last Academic Year | Jul/Last Academic Year | 1000         | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R13/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | May/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | Learning         |
	And at month end only the following provider payments will be generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R13/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | May/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | Learning         |
        | R13/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | Learning         |