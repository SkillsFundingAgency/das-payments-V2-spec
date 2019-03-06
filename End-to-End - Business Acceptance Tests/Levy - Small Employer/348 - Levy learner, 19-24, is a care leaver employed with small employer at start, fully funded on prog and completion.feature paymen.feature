@SmallEmployerDas   
1 learner aged 19-24, Levy, is a care leaver, employed with a small employer at start, is fully funded for on programme and completion payments
    Given levy balance > agreed price for all months
	And the apprenticeship funding band maximum is 9000
    And the following commitments exist:
        | ULN       | framework code | programme type | pathway code | agreed price | start date | end date   |
        | learner a | 403            | 2              | 1            | 7500         | 06/08/2018 | 08/08/2019 |
    When an ILR file is submitted with the following data:
        | ULN       | learner type             | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code | Employment Status  | Employment Status Applies | Employer Id | Small Employer | LearnDelFAM |
        | learner a | 19-24 programme only DAS | 7500         | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 403            | 2              | 1            | In paid employment | 05/08/2018                | 12345678    | SEM1           | EEF4        |
	And the employment status in the ILR is:
        | Employer    | Employment Status      | Employment Status Applies | Small Employer |
        | employer 1  | in paid employment     | 05/08/2018                | SEM1           |
    Then the provider earnings and payments break down as follows:
        | Type                                | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 | 09/19 |
        | Provider Earned Total               | 620   | 620   | 620   | 1620  | 620   | ... | 620   | 2860  | 0     |
        | Provider Earned from SFA            | 620   | 620   | 620   | 1620  | 620   | ... | 620   | 2860  | 0     |
        | Provider Earned from Employer       | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | Provider Paid by SFA                | 0     | 620   | 620   | 620   | 1620  | ... | 620   | 620   | 2860  |
        | Payment due from Employer           | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | Levy account debited                | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA Levy employer budget            | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     |
        | SFA Levy co-funding budget          | 500   | 500   | 500   | 500   | 500   | ... | 500   | 1500  | 0     |
        | SFA Levy additional payments budget | 120   | 120   | 120   | 1120  | 120   | ... | 120   | 1360  | 0     |

    And the transaction types for the payments are:
        | Payment type                 | 09/18 | 10/17 | 11/17 | 12/17 | ... | 08/18 | 09/18 |
        | On-program                   | 500   | 500   | 500   | 500   | ... | 500   | 0     |
        | Completion                   | 0     | 0     | 0     | 0     | ... | 0     | 1500  |
        | Balancing                    | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        | Employer 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
        | Provider 16-18 incentive     | 0     | 0     | 0     | 500   | ... | 0     | 500   |
        | Framework uplift on-program  | 120   | 120   | 120   | 120   | ... | 120   | 0     |
        | Framework uplift completion  | 0     | 0     | 0     | 0     | ... | 0     | 360   |
        | Framework uplift balancing   | 0     | 0     | 0     | 0     | ... | 0     | 0     |
        | Provider disadvantage uplift | 0     | 0     | 0     | 0     | ..  | 0     | 0     |
