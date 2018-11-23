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