Feature: Employer Stops On Date Of Balancing Payment

Scenario: Levy learner, Employer stops commitment on the day the course is completed, completes course early. Completion and Balancing payment is paid

	Given levy balance > agreed price for all months
    And the following commitments exist:
        | commitment Id | version Id | ULN       | start date | end date   | status    | agreed price | effective from | effective to | stop effective from |
        | 1             | 1          | learner a | 01/08/2018 | 01/09/2019 | cancelled | 15000        | 01/08/2018     | 01/09/2019   | 09/07/2019          |
       
	When an ILR file is submitted with the following data:
        | ULN       | agreed price | learner type       | start date | planned end date | actual end date | completion status |
        | learner a | 15000        | programme only DAS | 01/08/2018 | 09/08/2019       | 09/07/2019      | completed         |
       
	Then the provider earnings and payments break down as follows:
        | Type                           | 08/18 | 09/18 | ... | 06/19 | 07/19 | 08/19 |
        | Provider Earned Total          | 1000  | 1000  | ... | 1000  | 4000  | 0     |
        | Provider Earned from SFA       | 1000  | 1000  | ... | 1000  | 4000  | 0     |
        | Provider Earned from Employer  | 0     | 0     | ... | 0     | 0     | 0     |
        | Provider Paid by SFA           | 0     | 1000  | ... | 1000  | 1000  | 4000  |
        | Payment due from Employer      | 0     | 0     | ... | 0     | 0     | 0     |
        | Levy account debited           | 0     | 1000  | ... | 1000  | 1000  | 4000  |
        | SFA Levy employer budget       | 1000  | 1000  | ... | 1000  | 4000  | 0     |
        | SFA Levy co-funding budget     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA non-Levy co-funding budget | 0     | 0     | ... | 0     | 0     | 0     |

    And the transaction types for the payments are:
        | Payment type                 | 09/18 | ... | 06/19 | 07/19 | 08/19 |
        | On-program                   | 1000  | ... | 1000  | 1000  | 0     |
        | Completion                   | 0     | ... | 0     | 0     | 3000  |
        | Balancing                    | 0     | ... | 0     | 0     | 1000  |
        | Employer 16-18 incentive     | 0     | ... | 0     | 0     | 0     |
        | Provider 16-18 incentive     | 0     | ... | 0     | 0     | 0     |
        | Framework uplift on-program  | 0     | ... | 0     | 0     | 0     |
        | Framework uplift completion  | 0     | ... | 0     | 0     | 0     |
        | Framework uplift balancing   | 0     | ... | 0     | 0     | 0     |
        | Provider disadvantage uplift | 0     | ... | 0     | 0     | 0     |