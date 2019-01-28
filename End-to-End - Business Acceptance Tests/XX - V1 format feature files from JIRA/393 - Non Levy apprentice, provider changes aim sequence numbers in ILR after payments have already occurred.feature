Non Levy apprentice, provider changes aim sequence numbers in ILR after payments have already occurred
(657.75 11/18 payment includes 08/18 and 09/18 English & Maths payments)

Profile remains the same, don't pull back and re-pay when the aim sequence number changes.  Need to use this to ensure continuation of payments.

        Given the apprenticeship funding band maximum is 9000

        When an ILR file is submitted for period R01 with the following data:
			| ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | aim type  | aim sequence number | aim rate | framework code | programme type | pathway code |
			| learner a | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | programme | 1                   |          | 403            | 2              | 1            |
        
        And an ILR file is submitted for period R03 with the following data:
			| ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim sequence number | aim rate | framework code | programme type | pathway code |
			| learner a | programme only non-DAS | 9000         | 06/08/2018 | 20/08/2019       |                 | continuing        | programme        | 2                   |          | 403            | 2              | 1            |
			| learner a | programme only non-DAS |              | 06/08/2018 | 20/08/2019       |                 | continuing        | maths or english | 1                   | 471      | 403            | 2              | 1            |
  	
        Then the provider earnings and payments break down as follows:
			| Type                                    | 08/18 | 09/18 | 10/18  | 11/18  |
			| Provider Earned Total                   | 600   | 600   | 639.25 | 639.25 |
			| Provider Earned from SFA                | 540   | 540   | 579.25 | 0      |
			| Provider Earned from Employer           | 60    | 60    | 60     | 0      |
			| Provider Paid by SFA                    | 0     | 540   | 540    | 657.75 |
			| Refund taken by SFA                     | 0     | 0     | 0      | 0      |
			| Payment due from Employer               | 0     | 60    | 60     | 60     |
			| Refund due to employer                  | 0     | 0     | 0      | 0      |
			| Levy account debited                    | 0     | 0     | 0      | 0      |
			| Levy account credited                   | 0     | 0     | 0      | 0      |
			| SFA Levy employer budget                | 0     | 0     | 0      | 0      |
			| SFA Levy co-funding budget              | 0     | 0     | 0      | 0      |
			| SFA Levy additional payments budget     | 0     | 0     | 0      | 0      |
			| SFA non-Levy co-funding budget          | 540   | 540   | 540    | 540    |
			| SFA non-Levy additional payments budget | 39.25 | 39.25 | 39.25  | 39.25  |