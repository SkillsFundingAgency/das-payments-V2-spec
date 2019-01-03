#Scenario: 683-AC01- DAS learner, levy available, 2 providers - provider A and provider B, Provider B retrospectively notifies a withdrawal and previously-paid monthly instalments need to be refunded, 
#and this refund must be credited to Provider A where refunded Levy amount will be in excess of the available Levy for that period.
#
#	Given The learner is programme only DAS
#	And the apprenticeship funding band maximum is 17000
#	And the employer's levy balance is:
#        | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | 0     | 1125  | 1125  | 1125  | 1125  | 1125  | 1125  |
#	And the following commitments exist:
#		| commitment Id | Provider   | version Id | ULN       | start date | end date   | status | standard code | programme type	| agreed price | effective from | effective to |
#		| 1             | Provider A | 1          | Learner A | 01/08/2018 | 01/08/2019 | active | 25            | 25				| 5625         | 01/08/2018     |              |
#		| 2             | Provider B | 1          | Learner B | 01/08/2018 | 01/08/2019 | active | 25            | 25				| 11250        | 01/08/2018     |              |
#	
#	And following learning has been recorded for previous payments:
#		| ULN       | start date | aim sequence number | completion status | standard code | programme type |
#		| Learner A | 04/08/2018 | 1                   | continuing        | 25            | 25				|
#		| Learner B | 04/08/2018 | 1                   | continuing        | 25            | 25				|
#
#
#	And the following earnings and payments have been made to the Provider A for Learner A:
#		| Type                                | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |01/19|     
#		| Provider Earned Total               | 375   | 375   | 375   | 375   | 375   | 0   |
#		| Provider Paid by SFA                | 375   | 375   | 375   | 375   | 375   | 0   | 
#		| Provider Earned from Employer       | 0     | 0     | 0     | 0     |  0    | 0   |
#		| Provider Paid by SFA                |  0    | 375   | 375   | 375   | 375   | 375 |
#		| Payment due from Employer           | 0     | 0     | 0     | 0     |   0   | 0   |
#		| Levy account debited                | 0     | 375   | 375   | 375   | 375   | 0   | 
#		| SFA Levy employer budget            | 375   | 375   | 375   | 375   | 375   | 0   | 
#		| SFA Levy co-funding budget          | 0     | 0     | 0     | 0     | 0     | 0   | 
#	And the following earnings and payments have been made to the Provider B for Learner B:
#		| Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 |
#		| Provider Earned Total         | 750   | 750   | 750   | 750   | 750   | 0     |
#		| Provider Earned from SFA      | 750   | 750   | 750   | 750   | 750   | 0     |
#		| Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Provider Paid by SFA          | 0     | 750   | 750   | 750   | 750   | 750   |
#		| Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Levy account debited          | 0     | 750   | 750   | 750   | 750   | 750   |
#		| SFA Levy employer budget      | 750   | 750   | 750   | 750   | 750   | 0     |
#		| SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     |  
#		
#    When an ILR file is submitted for the first time on 10/01/19 with the following data:
#		| ULN       | Provider   | start date | planned end date | actual end date | completion status | standard code | programme type		| Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#		| Learner A | Provider A | 04/08/2018 | 20/08/2019       |                 | Continuing        | 25            | 25					| 4500                 | 04/08/2018                          | 1125                   | 04/08/2018                            |
#		| Learner B | Provider B | 04/08/2018 | 20/08/2019       | 12/11/2018      | withdrawn         | 25            | 25					| 9000                 | 04/08/2018                          | 2250                   | 04/08/2018                            |
#
#    Then OBSOLETE - the earnings and payments break down for provider A is as follows:
#		| Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 |
#		| Provider Earned Total         | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Provider Earned from SFA      | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Provider Paid by SFA          | 0     | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Refund taken by SFA           | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| Levy account debited          | 0     | 375   | 375   | 375   | 375   | 375   | 375   |
#		| Levy account credited         | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#		| SFA Levy employer budget      | 375   | 375   | 375   | 375   | 375   | 375   | 375   |
#		| SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#
#    Then OBSOLETE - the earnings and payments break down for provider B is as follows:
#        | Type                          | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | 02/19 |
#        | Provider Earned Total         | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | Provider Earned from SFA      | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | Provider Earned from Employer | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Provider Paid by SFA          | 0     | 750   | 750   | 750   | 750   | 750   | 0     |
#        | Refund taken by SFA           | 0     | 0     | 0     | 0     | 0     | 0     | -1500 |
#        | Payment due from Employer     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#        | Levy account debited          | 0     | 750   | 750   | 750   | 750   | 750   | 0     |
#        | Levy account credited         | 0     | 0     | 0     | 0     | 0     | 0     | 1500  |
#        | SFA Levy employer budget      | 750   | 750   | 750   | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget    | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
#	 And the net effect on employer's levy balance after each period end is:
#        | 01/19 | 02/19 | 03/19 | 04/19 | 05/19 | 06/19 | 07/19 |
#        | -1125 | 750   | 750   | 750   | 750   | 750   | 750   |