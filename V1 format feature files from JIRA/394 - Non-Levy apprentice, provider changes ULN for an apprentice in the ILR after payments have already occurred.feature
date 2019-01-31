Non-Levy apprentice, provider changes ULN for an apprentice in the ILR after payments have already occurred

        Given the apprenticeship funding band maximum is 9000
       
        When an ILR file is submitted for period R01 with the following data:
		
			| learner reference number | ULN        | learner type           | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code |
			| learner a                | 1111111111 | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | 403            | 2              | 1            |
        
        And an ILR file is submitted for period R03 with the following data:
		
			| learner reference number | ULN        | learner type           | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code |
			| learner a                | 2222222222 | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | 403            | 2              | 1            |
        
        Then the provider earnings and payments break down as follows:
			| Type                                    | 08/18 | 09/18 | 10/18 | 11/18 |
			| Provider Earned Total                   | 600   | 600   | 600   | 600   |
			| Provider Earned from SFA                | 540   | 540   | 540   | 540   |
			| Provider Earned from Employer           | 60    | 60    | 60    | 60    |
			| Provider Paid by SFA                    | 0     | 540   | 540   | 540   |
			| Refund taken by SFA                     | 0     | 0     | 0     | 0     |
			| Payment due from Employer               | 0     | 60    | 60    | 60    |
			| Refund due to employer                  | 0     | 0     | 0     | 0     |
			| Levy account debited                    | 0     | 0     | 0     | 0     |
			| Levy account credited                   | 0     | 0     | 0     | 0     |
			| SFA Levy employer budget                | 0     | 0     | 0     | 0     |
			| SFA Levy co-funding budget              | 0     | 0     | 0     | 0     |
			| SFA Levy additional payments budget     | 0     | 0     | 0     | 0     |
			| SFA non-Levy co-funding budget          | 540   | 540   | 540   | 540   |
			| SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 