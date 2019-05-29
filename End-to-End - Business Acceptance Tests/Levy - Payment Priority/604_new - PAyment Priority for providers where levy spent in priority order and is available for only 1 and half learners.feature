Feature: Payment Priority

Background: 2 providers, paid in priority order

Scenario: Earnings and payments for two Levy learners with different providers, levy is spent in priority order and there is enough levy to fund one and a half learners

        Given Two learners are programme only DAS 
		And the apprenticeship funding band maximum for each learner is 17000
        
		And the employer's levy balance is:
                | 09/18 | 10/18 | 11/18 | 12/18 | ...  | 09/19 | 10/19 |
                | 1500  | 1500  | 1500  | 1500  | 1500 | 1500  | 1500  |
				
		And the provider priority order is:
                | priority | provider |
                | 1        | ABC 	  |
                | 2        | DEF 	  |
        
		And the following commitments exist on 03/12/2018:
                | priority | provider | learner  | start date | end date   | agreed price |
                | 1        | ABC 	  | 1   	 | 01/08/2018 | 28/08/2019 | 15000        |
                | 2        | DEF 	  | 1   	 | 01/08/2018 | 28/08/2019 | 15000        |
        
		
		
		When an ILR file is submitted by provider ABC on 03/12/2018 with the following data:
                | provider | learner  | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
                | ABC 	   | 1   	  | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |
       
		When an ILR file is submitted by provider DEF on 03/12/2018 with the following data:
                | provider | learner  | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
                | DEF 	   | 1   	  | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |
       		
		
		
		Then the provider earnings and payments break down for provider ABC as follows:
                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
                | Provider Earned Total          | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
                | Provider Earned from SFA       | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
                | Provider Earned from Employer  | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | Provider Paid by SFA           | 0     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
                | Payment due from Employer      | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | Levy account debited           | 0     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
                | SFA Levy employer budget       | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
                | SFA Levy co-funding budget     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        
		And the transaction types for the payments for provider ABC are:
				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
				| On-program                     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
		
		
		

		And the provider earnings and payments break down for provider DEF as follows:
                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
                | Provider Earned Total          | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
                | Provider Earned from SFA       | 950   | 950   | 950   | 950   | ... | 950   | 0     |
                | Provider Earned from Employer  | 50    | 50    | 50    | 50    | ... | 50    | 0     |
                | Provider Paid by SFA           | 0     | 950   | 950   | 950   | ... | 950   | 950   |
                | Payment due from Employer      | 0     | 50    | 50    | 50    | ... | 50    | 50    |
                | Levy account debited           | 0     | 500   | 500   | 500   | ... | 500   | 500   |
                | SFA Levy employer budget       | 500   | 500   | 500   | 500   | ... | 500   | 0     |
                | SFA Levy co-funding budget     | 450   | 450   | 450   | 450   | ... | 450   | 0     |
                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        
		And the transaction types for the payments for provider DEF are:
				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
				| On-program                     | 950   | 950   | 950   | ... | 950   | 950   |
				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
		
		
		And OBSOLETE - the provider earnings and payments break down as follows:
                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
                | Provider Earned Total          | 2000  | 2000  | 2000  | 2000  | ... | 2000  | 0     |
                | Provider Earned from SFA       | 1950  | 1950  | 1950  | 1950  | ... | 1950  | 0     |
                | Provider Earned from Employer  | 50    | 50    | 50    | 50    | ... | 50    | 0     |
                | Provider Paid by SFA           | 0     | 1950  | 1950  | 1950  | ... | 1950  | 1950  |
                | Payment due from Employer      | 0     | 50    | 50    | 50    | ... | 50    | 50    |
                | Levy account debited           | 0     | 1500  | 1500  | 1500  | ... | 1500  | 1500  |
                | SFA Levy employer budget       | 1500  | 1500  | 1500  | 1500  | ... | 1500  | 0     |
                | SFA Levy co-funding budget     | 450   | 450   | 450   | 450   | ... | 450   | 0     |
                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |