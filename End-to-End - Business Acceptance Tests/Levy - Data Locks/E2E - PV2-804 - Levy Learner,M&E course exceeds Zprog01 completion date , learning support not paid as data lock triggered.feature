Feature: LearningSupport	

Scenario: Levy learner, takes an English qualification that has a planned end date that exceeds the actual end date of the programme aim and learning support is applicable for all learning - but the apprentice fails data lock and so no payments are made
	
	Given levy balance > agreed price for all months 
	And the following commitments exist:
		| commitment Id | ULN       | start date | end date   | agreed price | status |
		| 1             | learner a | 01/08/2018 | 01/08/2019 | 15500        | active |
	
	When an ILR file is submitted with the following data:
		| ULN       | learner type       | aim type         | agreed price | aim rate | start date | planned end date | actual end date | completion status | learning support code | learning support date from | learning support date to |
		| learner a | programme only DAS | programme        | 15000        |          | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | 1                     | 06/08/2018         		 | 06/10/2019       		|
		| learner a | programme only DAS | maths or english |              | 471      | 06/08/2018 | 06/10/2019       | 06/10/2019      | completed         | 1                     | 06/08/2018         		 | 06/10/2019       		|  
	
	Then the data lock status will be as follows:
		| Payment type                   | 08/18 | 09/18 | 10/18 | ... | 07/19 | 08/19 | 09/19 | 10/19 | 11/19 |
		| On-program                     |       |       |       | ... |       |       |       |       |       |
		| Completion                     |       |       |       | ... |       |       |       |       |       |
		| Employer 16-18 incentive       |       |       |       | ... |       |       |       |       |       |
		| Provider 16-18 incentive       |       |       |       | ... |       |       |       |       |       |
		| Provider learning support      |       |       |       | ... |       |       |       |       |       |
		| English and maths on programme |       |       |       | ... |       |       |       |       |       |
		| English and maths Balancing    |       |       |       | ... |       |       |       |       |       |        

    And the provider earnings and payments break down as follows:
		| Type                                    | 08/18   | 09/18   | 10/18   | ... | 05/19   | 06/19   | 07/19   | 08/19   | 09/19  | 10/19 | 11/19 |
		| Provider Earned Total                   | 1183.64 | 1183.64 | 1183.64 | ... | 1183.64 | 1183.64 | 1183.64 | 3183.64 | 183.64 | 0     | 0     |
		| Provider Paid by SFA                    | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| Payment due from Employer               | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| Levy account debited                    | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| SFA Levy employer budget                | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| SFA Levy co-funding budget              | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| SFA non-Levy co-funding budget          | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| SFA Levy additional payments budget     | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     |
		| SFA non-Levy additional payments budget | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0      | 0     | 0     | 
      
	And the transaction types for the payments are:
		| Payment type                   | 09/18 | 10/18 | ... | 05/19 | 06/19 | 07/19 | 08/19 | 09/19 | 10/19 | 11/19 |
		| On-program                     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
		| Completion                     | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
		| Balancing                      | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
		| English and maths on programme | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
		| English and maths Balancing    | 0     | 0     | ... | 0     | 0     | 0     | 0     | 0     | 0     | 0     |	
