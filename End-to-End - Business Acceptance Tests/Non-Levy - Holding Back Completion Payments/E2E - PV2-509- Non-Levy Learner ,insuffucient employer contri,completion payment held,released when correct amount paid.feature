#Feature: Holding back completion payments
# 
#Scenario: AC6 - 1 learner, non-levy, co-funding has been used and provider data shows not enough employer contribution at the time completion is recorded, 
#but then another contribution is evidenced later – don’t pay completion initially, but then release completion payment when extra contribution is recorded
#
#	Given the apprenticeship funding band maximum is 9000
#
#    When an ILR file is submitted for academic year 1718 in period R11 with the following data:
#
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | 
#        | learner a | programme only non-DAS | 9000         | 06/06/2018 | 08/06/2019       | 	              | continuing        |
#
#	And an ILR file is submitted for academic year 1819 in period R01 with the following data:
#	
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | 
#        | learner a | programme only non-DAS | 9000         | 06/06/2018 | 08/06/2019       | 	              | continuing        |	
#	
#	And an ILR file is submitted for academic year 1819 in period R11 with the following data:
#
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | employer contributions |
#        | learner a | programme only non-DAS | 9000         | 06/06/2018 | 08/06/2019       | 18/06/2019      | completed         | 719					   |
#		
#    And an ILR file is submitted for academic year 1819 in period R12 with the following data:
#
#        | ULN       | learner type           | agreed price | start date | planned end date | actual end date | completion status | employer contributions |
#        | learner a | programme only non-DAS | 9000         | 06/06/2018 | 08/06/2019       | 18/06/2019      | completed         | 720					   |
#
#	Then the provider earnings and payments break down as follows:
#
#        | Type                                       | 06/18 | 07/18 | 08/18 | ... | 05/19 | 06/19 | 07/19 | 08/19 |
#        | Provider Earned Total                      | 600   | 600   | 600   | ... | 600   | 1800  | 0     | 0     |
#		| Provider Earned from SFA               	 | 540   | 540   | 540   | ... | 540   | 1620  | 0	   | 0     |
#		| Provider Earned from Employer          	 | 60    | 60    | 60    | ... | 60    | 180   | 0	   | 0     |
#        | Provider Paid by SFA                       | 0     | 540   | 540   | ... | 540   | 540   | 0     | 1620  |
#	    | Payment due from Employer                  | 0     | 60    | 60    | ... | 60    | 60    | 0     | 180   |
#        | Levy account debited                       | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | SFA Levy employer budget                   | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | SFA Levy co-funding budget                 | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#        | SFA Levy additional payments budget        | 0     | 0     | 0     | ... | 0     | 0	   | 0     | 0     |
#	    | SFA non-Levy co-funding budget             | 540   | 540   | 540   | ... | 540   | 1620  | 0     | 0     |
#	    | SFA non-Levy additional payments budget    | 0     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#
#    And the transaction types for the payments are:
#
#	    | Payment type                               | 07/18 | 08/18 | 09/18 | ... | 05/19 | 06/19 | 07/19 | 08/19 |
#        | On-program                                 | 540   | 540   | 540   | ... | 540   | 540   | 0	   | 0     |
#        | Completion                                 | 0     | 0     | 0     | ... | 0     | 0     | 0     | 1620  |
#        | Balancing                                  | 0     | 0     | 0     | ... | 0     | 0     | 0	   | 0	   |
#			
#Maths.
#Price x 0.20 = £7,200
#£7,200 x 0.90 = £720 = Employer Contribution
#£720/12 = £60 
#
#Completion payment workings:
#£9000 x 0.20 = £1,800
#£1800 x 0.90 (for co-funded) = £1620 = SFA, & £180 Employer contribution.
#
#We expect the employer contributions to total 720 in order for the completion payment to be released to the training provider.