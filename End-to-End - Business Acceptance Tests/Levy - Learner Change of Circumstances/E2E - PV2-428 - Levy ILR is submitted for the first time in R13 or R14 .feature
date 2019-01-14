   Scenario: ILR submitted late (after the academic year boundary) for a DAS learner, levy available
		
Given the apprenticeship funding band maximum for each learner is 17000
And levy balance > agreed price for all months
When a provider submits an ILR several months after learning has started (but before the academic year boundary), 
the earnings calculation is updated retrospectively and the provider gets paid for the preceding months.
	
	Given the following commitments exist:
		
            | ULN       | priority | start date | end date   | agreed price |
            | learner a | 1        | 01/09/2018 | 08/09/2019 | 15000        |
        
		When an ILR file is submitted for the first time on 28/08/19 with the following data:
		
            | ULN       | learner type       | agreed price | start date | planned end date | completion status |
            | learner a | programme only DAS | 15000        | 01/09/2018 | 08/09/2019       | continuing        |
       
	   Then the provider earnings and payments break down as follows:
	   
            | Type                       | 04/19 | 05/19 | 06/19 | 07/19 | 08/19 | 09/19 | ... |
            | Provider Earned Total      | 1000  | 1000  | 1000  | 1000  | 1000  | 0     | ... |
            | Provider Earned from SFA   | 1000  | 1000  | 1000  | 1000  | 1000  | 0     | ... |
            | Provider Paid by SFA       | 0     | 0     | 0     | 0     | 11000 | 1000  | ... |
            | Levy account debited       | 0     | 0     | 0     | 0     | 11000 | 1000  | ... |
            | SFA Levy employer budget   | 1000  | 1000  | 1000  | 1000  | 1000  | 1000  | ... |
            | SFA Levy co-funding budget | 0     | 0     | 0     | 0     | 0     | 0     | ... |