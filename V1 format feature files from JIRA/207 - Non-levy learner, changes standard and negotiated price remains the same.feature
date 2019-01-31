Non-Levy learner, changes standard, negotiated price remains the same	

Feature: Provider earnings and payments where learner changes apprenticeship standard and negotiated price remains the same, (remaining with the same employer and provider)

    Background:
	
        Given The learner is programme only non-DAS
        And the apprenticeship funding band maximum is 17000
 
		When an ILR file is submitted with the following data:
            | ULN       | standard code | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
            | learner a | 51            | 03/08/2018 | 01/08/2019       | 31/10/2018      | withdrawn         | 12000                | 03/08/2018                          | 3000                   | 03/08/2018                            |
            | learner a | 52            | 03/11/2018 | 01/08/2019       |                 | continuing        | 12000                | 03/11/2018                          | 3000                   | 03/11/2018                            |
       		
		Then the provider earnings and payments break down as follows:
		
            | Type                       		| 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
            | Provider Earned Total      		| 1000  | 1000  | 1000  | 1000  | 1000  |
            | Provider Earned from SFA   		| 900   |  900  |  900  | 900   | 900   |
            | Provider Earned from Employer 	| 100   |  100  |  100  | 100   | 100   |            
			| Provider Paid by SFA       		| 0     |  900  |  900  | 900   | 900   |
            | Payment due from Employer         | 0     |  100  |  100  | 100   | 100   | 
			| Levy account debited       		| 0     |    0  |    0  | 0     | 0     |
            | SFA Levy employer budget   		| 0     |    0  |    0  | 0     | 0     |
            | SFA Levy co-funding budget 		| 0     |    0  |    0  | 0     | 0     |
			| SFA non-Levy co-funding budget	| 900   |  900  |  900  | 900   | 900   | 
			
			