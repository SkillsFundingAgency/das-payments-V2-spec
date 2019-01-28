Scenario: ILR submitted late for a non-DAS learner
		
Given the apprenticeship funding band maximum for each learner is 17000
When a provider submits an ILR several months after learning has started (but before the academic year boundary), 
the earnings calculation is updated retrospectively and the provider gets paid for the preceding months.
	 
		When an ILR file is submitted for the first time on 28/12/18 with the following data:
		
            | ULN       | learner type       | agreed price | start date | planned end date | completion status |
            | learner a | programme only DAS | 15000        | 01/09/2018 | 08/09/2019       | continuing        |
       
	   Then the provider earnings and payments break down as follows:
	   
            | Type                          | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 | ... |
            | Provider Earned Total         | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  | ... |
            | Provider Earned from SFA      | 900   | 900   | 900   | 900   |  900  |  900  | ... |
            | Provider Paid by SFA          | 0     | 0     | 0     | 0     | 3600  |    0  | ... |
            | Payment due from Employer     | 100   | 100   | 100   | 100   |  400  |  100	| ... |		                          
			| Levy account debited          | 0     | 0     | 0     | 0     |   0   |    0  | ... |
            | SFA Levy employer budget      | 0     | 0     | 0     | 0     |   0   |    0  | ... |
            | SFA Levy co-funding budget    | 0     | 0     | 0     | 0     |   0   |    0  | ... |				
            | SFA non-Levy co-funding budget| 900   | 900   | 900   | 900   | 900   |  900	| ... |	

#
#
#Given the following learner
#		| learnerId | Learner Reference Number | Uln      |
#		| learner a | abc123                   | 12345678 |
#	And the following aims
#		| Reference | Start Date                   | Planned Duration | Actual Duration | Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status|
#		| ZPROG001  | 03/Aug/Current Academic Year | 12 months        | 3 months        | 1               | 25             | 51            | 16-18 Apprenticeship Non-Levy |withdrawn         |
#		| ZPROG001  | 03/Nov/Current Academic Year | 9 months         |                 | 2               | 25             | 52            | 16-18 Apprenticeship Non-Levy |continuing        |
#	And price details as follows		
#        | Price Episode Id | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
#        | 51-25-2018-08-01 | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   | 90%                         |
#        | 52-25-2018-11-01 | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          | Act2          | 2                   | 90%                         |
#
#
#	Given the provider is providing training for the following learners
#        | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Programme Type | Standard Code | Funding Line Type                                                     | SFA Contribution Percentage |
#        | 1        | 03/Aug/Current Academic Year | 12 months        | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          |                 | Continuing        | Act2          | 1                   | ZPROG001      | 25             | 51            | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
#      
#	And the provider changes the Standard Type to 52 effective from 03/Nov/Current Academic Year