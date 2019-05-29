Feature: Payment Priority

Background: 2 providers, paid in priority order

Scenario: Earnings and payments for two DAS learners with different providers, levy is spent in priority order and available for both providers

        Given Two learners are programme only DAS 
        And the apprenticeship funding band maximum for each learner is 17000
     
		And the employer's levy balance is:
                | 09/18 | 10/18 | 11/18 | 12/18 | ...  | 09/19 | 10/19 |
                | 2000  | 2000  | 2000  | 2000  | 2000 | 2000  | 2000  |
				
		And the provider priority order is: (*published by approvals)
                | priority | Provider |
                | 1        | ABC 	  |
                | 2        | DEF 	  |
        
		And the following commitments exist on 03/12/2018:
                | priority | Provider | Learner   | start date | end date   | agreed price |
                | 1        | ABC 	  | 1   	  | 01/08/2018 | 28/08/2019 | 15000        |
                | 2        | DEF 	  | 1    	  | 01/08/2018 | 28/08/2019 | 15000        |
        
		
	
		When an ILR file is submitted by provider ABC on 03/12/2018 with the following data:
                | Provider | Learner | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
                | ABC      | 1       | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |

		And an ILR file is submitted by provider DEF on 03/12/2018 with the following data:
                | Provider | Learner | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
                | DEF      | 1       | 01/08/2018 | 28/08/2019       |                 | continuing        | 12000                | 01/08/2018                          | 3000                   | 01/08/2018                            |		
			
  
		Then the provider earnings and payments break down for Provider ABC as follows:
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
        
		And the transaction types for the payments for Provider ABC are:
				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
				| On-program                     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
	
	
		
		And the provider earnings and payments break down for Provider DEF as follows:
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
        
		And the transaction types for the payments for Provider DEF are:
				| Payment type                   | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
				| On-program                     | 1000  | 1000  | 1000  | ... | 1000  | 1000  |
				| Completion                     | 0     | 0     | 0     | ... | 0     | 0     |
				| Balancing                      | 0     | 0     | 0     | ... | 0     | 0     |
		
		
		And OBSOLETE - the provider earnings and payments break down as follows:
                | Type                           | 08/18 | 09/18 | 10/18 | 11/18 | ... | 07/19 | 08/19 |
                | Provider Earned Total          | 2000  | 2000  | 2000  | 2000  | ... | 2000  | 0     |
                | Provider Earned from SFA       | 2000  | 2000  | 2000  | 2000  | ... | 2000  | 0     |
                | Provider Earned from Employer  | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | Provider Paid by SFA           | 0     | 2000  | 2000  | 2000  | ... | 2000  | 2000  |
                | Payment due from Employer      | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | Levy account debited           | 0     | 2000  | 2000  | 2000  | ... | 2000  | 2000  |
                | SFA Levy employer budget       | 2000  | 2000  | 2000  | 2000  | ... | 2000  | 0     |
                | SFA Levy co-funding budget     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
                | SFA non-Levy co-funding budget | 0     | 0     | 0     | 0     | ... | 0     | 0     |
				
				
