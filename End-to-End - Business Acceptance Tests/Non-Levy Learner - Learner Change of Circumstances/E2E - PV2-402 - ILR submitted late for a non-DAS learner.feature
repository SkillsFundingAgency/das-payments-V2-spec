#Scenario: ILR submitted late for a non-DAS learner
#		
#Given the apprenticeship funding band maximum for each learner is 17000
#When a provider submits an ILR several months after learning has started (but before the academic year boundary), 
#the earnings calculation is updated retrospectively and the provider gets paid for the preceding months.
#	 
#		When an ILR file is submitted for the first time on 28/12/18 with the following data:
#		
#            | ULN       | learner type       | agreed price | start date | planned end date | completion status |
#            | learner a | programme only DAS | 15000        | 01/09/2018 | 08/09/2019       | continuing        |
#       
#	   Then the provider earnings and payments break down as follows:
#	   
#            | Type                          | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... |
#            | Provider Earned Total         | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  | ... |
#            | Provider Earned from SFA      | 900   | 900   | 900   | 900   |  900  |  900  | ... |
#            | Provider Paid by SFA          | 0     | 0     | 0     | 0     | 3600  |    0  | ... |
#            | Payment due from Employer     | 100   | 100   | 100   | 100   |  400  |  100	| ... |		                          
#			| Levy account debited          | 0     | 0     | 0     | 0     |   0   |    0  | ... |
#            | SFA Levy employer budget      | 0     | 0     | 0     | 0     |   0   |    0  | ... |
#            | SFA Levy co-funding budget    | 0     | 0     | 0     | 0     |   0   |    0  | ... |				
#            | SFA non-Levy co-funding budget| 900   | 900   | 900   | 900   | 900   |  900	| ... |	


#Notes: Single collection preiod but multiple delivery periods. 
#		Restricted the test to 2 collection periods

Scenario Outline: ILR submitted late for a non-DAS learner ILR PV2-402
    Given the provider is providing training for the following learners
        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
        | 1        | 01/Sep/Current Academic Year | 12 months        | 12000                | 01/Sep/Current Academic Year        | 3000                   | 01/Sep/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	When the ILR file is submitted for the learners for collection period <collection_period>
	Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 0            | 0          | 0         |
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
		| R05/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         |
		| R05/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         |
		| R05/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         |
		| R05/Current Academic Year | Dec/Current Academic Year | 1000         | 0          | 0         |
        | R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R05/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
		| R05/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | Learning         |
		| R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | Learning         |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | Learning         |
Examples: 
        | Collection_Period         |
        | R05/Current Academic Year |
        | R06/Current Academic Year |