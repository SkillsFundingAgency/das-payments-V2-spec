Scenario: Payment for a DAS learner, lives in a disadvantaged postocde area - 01-10% most deprived, employer has sufficient levy funds in account, funding agreed within band maximum, UNDERTAKING APPRENTICESHIP FRAMEWORK
    #The provider incentive for this postcode group is £600 split equally into 2 payments at 90 and 365 days.INELIGIBLE FOR APPRENTICESHIP STANDARDS
    Given levy balance > agreed price for all months
    And the following commitments exist:
		| commitment Id | version Id | ULN       | start date  | end date   | framework code | programme type | pathway code | agreed price | status   |
        | 1             | 1          | learner a | 01/08/2018  | 01/08/2019 | 593            | 20             | 1            | 15000        | active   |
    When an ILR file is submitted with the following data:
        | ULN       | learner type       | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | home postcode deprivation |
        | learner a | programme only DAS | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | 593            | 20             | 1            | 1-10%                     |
    Then the provider earnings and payments break down as follows:
        | Type                                    | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
        | Provider Earned Total                   | 1000  | 1000  | 1000  | 1300  | 1000  | ... | 1000  | 300   | 0     |
		| Provider Earned from SFA                | 1000  | 1000  | 1000  | 1300  | 1000  | ... | 1000  | 300   | 0     |        
		| Provider Earned from Employer           | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | Provider Paid by SFA                    | 0     | 1000  | 1000  | 1000  | 1300  | ... | 1000  | 1000  | 300   |
        | Payment due from Employer               | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | Levy account debited                    | 0     | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 1000  | 0     |
        | SFA Levy employer budget                | 1000  | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     | 0     |
        | SFA Levy co-funding budget              | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA non-Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA non-Levy additional payments budget | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA Levy additional payments budget     | 0     | 0     | 0     | 300   | 0     | ... | 0     | 300   | 0     |
    And the transaction types for the payments are:
        | Payment type                 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 08/19 | 09/19 |
        | On-program                   | 1000  | 1000  | 1000  | 1000  | ... | 1000  | 0     |
        | Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        | Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        | Provider disadvantage uplift | 0     | 0     | 0     | 300   | ... | 0     | 300   |