# the provider changes the Standard Type to 52 effective from 03/Nov/Current Academic Year
    Given the following learners
		| learnerId | Learner Reference Number | Uln      |
		| learner a | abc123                   | 12345678 |
	And the following aims
		| learnerId | Reference | Start Date                   | Planned Duration | Actual Duration | Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status |
		| learner a | ZPROG001  | 03/Aug/Current Academic Year | 12 months        | 3 months        | 1               | 25             | 51            | 16-18 Apprenticeship Non-Levy | withdrawn         |
		| learner a | ZPROG001  | 03/Nov/Current Academic Year | 9 months         |                 | 2               | 25             | 52            | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows		
        | Price Episode Id                   | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number |
        | 51-25-03/Aug/Current Academic Year | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   |
        | 52-25-03/Nov/Current Academic Year | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          | Act2          | 2                   |


# the provider changes the Standard Type to 52 effective from 03/Nov/Current Academic Year
    Given the following learners
		| learnerId | Learner Reference Number | Uln      |
		| learner a | abc123                   | 12345678 |
	
	And the following aim
		| learnerId | Reference | Start Date                   | Planned Duration | Actual Duration | Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status |
		| learner a | ZPROG001  | 03/Aug/Current Academic Year | 12 months        | 3 months        | 1               | 25             | 51            | 16-18 Apprenticeship Non-Levy | withdrawn         |
	And price details as follows
		| Price Episode Id                   | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 51-25-03/Aug/Current Academic Year | 12000                | 03/Aug/Current Academic Year        | 3000                   | 03/Aug/Current Academic Year          | Act2          | 1                   | 90%                         |
    
	And the following aim
		| learnerId | Reference | Start Date                   | Planned Duration | Actual Duration | Sequence Number | Programme Type | Standard Code | Funding Line Type             | Completion Status |
		| learner a | ZPROG001  | 03/Nov/Current Academic Year | 9 months         |                 | 2               | 25             | 52            | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows		
        | Price Episode Id                   | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 52-25-03/Nov/Current Academic Year | 12000                | 03/Nov/Current Academic Year        | 3000                   | 03/Nov/Current Academic Year          | Act2          | 2                   | 90%                         |




