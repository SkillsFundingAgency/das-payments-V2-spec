@SmallEmployerMultipleEmploymentStatus
Scenario:- Payment for a 16-18 non-levy learner, small employer at start, change to large employer
	Given the apprenticeship funding band maximum is 9000
	When an ILR file is submitted with the following data:
		| ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | 
		| learner a | 16-18 programme only non-DAS | 7500         | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 403            | 2              | 1            | 
    
    And the employment status in the ILR is:
		| Employer    | Employment Status  | Employment Status Applies | Small Employer |
		| employer 1  | in paid employment | 05/08/2018                | SEM1           |
		| employer 2  | in paid employment | 05/10/2018                |                |
	
    Then the provider earnings and payments break down as follows:
		| Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
		| Provider Earned Total                   | 620   | 620   | 620   | 1620  | 620   | ... | 2860  | 0     |
		| Provider Earned from SFA                | 620   | 620   | 570   | 1570  | 570   | ... | 2710  | 0     |
		| Provider Earned from Employer           | 0     | 0     | 50    | 50    | 50    | ... | 150   | 0     |
		| Provider Paid by SFA                    | 0     | 620   | 620   | 570   | 1570  | ... | 570   | 2710  |
		| Payment due from Employer 2             | 0     | 0     | 0     | 50    | 50    | ... | 50    | 150   |
		| Levy account debited                    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
		| SFA Levy employer budget                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
		| SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
		| SFA non-Levy co-funding budget          | 500   | 500   | 450   | 450   | 450   | ... | 1350  | 0     |
		| SFA non-Levy additional payments budget | 120   | 120   | 120   | 1120  | 120   | ... | 1360  | 0     |
	
    And the transaction types for the payments are:
		| Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
		| On-program                   | 500   | 500   | 450   | 450   | ... | 450   | 0     |
		| Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 1350  |
		| Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
		| Employer 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
		| Provider 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
		| Framework uplift on-program  | 120   | 120   | 120   | 120   | ... | 120   | 0     |
		| Framework uplift completion  | 0     | 0     | 0     | 0     | ... | 0     | 360   |
		| Framework uplift balancing   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
		| Provider disadvantage uplift | 0     | 0     | 0     | 0     | ..  | 0     | 0     |