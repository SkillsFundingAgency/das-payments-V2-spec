#Scenario: non-Levy apprentice, changes aim reference for English/maths aims and payments are reconciled 
#
#		Given The learner is programme only non-Levy
#       
#        And the apprenticeship funding band maximum is 9000
#
#        And following learning has been recorded for previous payments:
#            | ULN       | start date | aim sequence number | aim type         | aim reference | framework code | programme type | pathway code | completion status |
#            | learner a | 06/05/2018 | 1                   | programme        | ZPROG001      | 403            | 2              | 1            | continuing        |
#  
#        And the following programme earnings and payments have been made to the provider A for learner a:
#		
#            | Type                                | 05/18 | 06/18 | 07/18 | 08/18 |
#            | Provider Earned Total               | 600   | 600   | 0     | 0     |
#            | Provider Earned from SFA            | 540   | 540   | 0     | 0     |
#            | Provider Earned from Employer       | 60    | 60    | 0     | 0     |
#            | Provider Paid by SFA                | 0     | 540   | 540   | 0     |
#            | Payment due from Employer           | 0     | 60    | 60    | 0     |
#            | Levy account debited                | 0     | 0     | 0     | 0     |
#            | SFA Levy employer budget            | 0     | 0     | 0     | 0     |
#            | SFA Levy co-funding budget          | 0     | 0     | 0     | 0     |
#            | SFA Levy additional payments budget | 0     | 0     | 0     | 0     |
#            | SFA non-Levy co-funding budget      | 540   | 540   | 540   | 0     | 
#
#		And following learning has been recorded for previous payments:
#            | ULN       | start date | aim sequence number | aim type         | aim reference | framework code | programme type | pathway code | completion status |
#            | learner a | 06/05/2018 | 2                   | maths or English | 60001227      | 403            | 2              | 1            | continuing        |
#  
#        And the following maths or english earnings and payments have been made to the provider A for learner a:
#		
#            | Type                                | 05/18 | 06/18 | 07/18 | 08/18 |
#            | Provider Earned Total               | 39.25 | 39.25 | 0     | 0     |
#            | Provider Earned from SFA            | 39.25 | 39.25 | 0     | 0     |
#            | Provider Earned from Employer       | 0     | 0     | 0     | 0     |
#            | Provider Paid by SFA                | 0     | 39.25 | 39.25 | 0     |
#            | Payment due from Employer           | 0     | 0     | 0     | 0     |
#            | Levy account debited                | 0     | 0     | 0     | 0     |
#            | SFA Levy employer budget            | 0     | 0     | 0     | 0     |
#            | SFA Levy co-funding budget          | 0     | 0     | 0     | 0     |
#            | SFA Levy additional payments budget | 39.25 | 39.25 | 0     | 0     |
#            | SFA non-Levy co-funding budget      | 0     | 0     | 0     | 0     | 
#        
#        When an ILR file is submitted for the first time on 31/07/18 with the following data:
#            | ULN       | learner type           | aim sequence number | aim type         | aim reference | aim rate | agreed price | start date | planned end date | actual end date | completion status | framework code | programme type | pathway code |
#            | learner a | programme only non-DAS | 2                   | programme        | ZPROG001      |          | 9000         | 06/05/2018 | 20/05/2019       |                 | continuing        | 403            | 2              | 1            |
#            | learner a | programme only non-DAS | 1                   | maths or English | 50086832      | 471      |              | 06/05/2018 | 20/05/2019       |                 | continuing        | 403            | 2              | 1            |
#  
#        Then the provider earnings and payments break down as follows:
#            | Type                                    | 05/18  | 06/18  | 07/18  | 08/18   | 09/18  | 10/18  |
#            | Provider Earned Total                   | 639.25 | 639.25 | 639.25 | 639.25  | 639.25 | 639.25 |
#            | Provider Earned from SFA                | 579.25 | 579.25 | 579.25 | 579.25  | 579.25 | 579.25 |
#            | Provider Earned from Employer           | 60     | 60     | 60     | 60      | 60     | 60     |
#            | Provider Paid by SFA                    | 0      | 579.25 | 579.25 | 657.75  | 579.25 | 579.25 |
#            | Refund taken by SFA                     | 0      | 0      | 0      | -78.50  | 0      | 0      |
#            | Payment due from Employer               | 0      | 0      | 0      | 0       | 0      | 0      |
#            | Refund due to employer                  | 0      | 0      | 0      | 0       | 0      | 0      |
#            | Levy account debited                    | 0      | 0      | 0      | 0       | 0      | 0      |
#            | Levy account credited                   | 0      | 0      | 0      | 0       | 0      | 0      |
#            | SFA Levy employer budget                | 0      | 0      | 0      | 0       | 0      | 0      |
#            | SFA Levy co-funding budget              | 0      | 0      | 0      | 0       | 0      | 0      |
#            | SFA Levy additional payments budget     | 0      | 0      | 0      | 0       | 0      | 0      | 
#            | SFA non-Levy co-funding budget          | 540    | 540    | 540    | 540     | 540    | 540    |
#            | SFA non-Levy additional payments budget | 39.25  | 39.25  | 39.25  | 39.25   | 39.25  | 39.25  |

# New template
Feature: Non-levy learner, changes aim reference for English/maths aims and payments are reconciled

Scenario Outline: Non-levy learner provider changes aim reference for English/maths aims and payments are reconciled PV2-463
	Given the following learners
        | Learner Reference Number | Uln      |
        | abc123                   | 12345678 |
	# New field - Aim Type
	# Note the change in the Aim reference
	And the following aims
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Programme        | ZPROG001      | 06/May/Current Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| Maths or English | 12345         | 06/May/Current Academic Year | 12 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details as follows	
	# Price details
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 1st price details | 9000                 | 06/May/Current Academic Year        | 0                      | 06/May/Current Academic Year          | Act2          | 1                   | 90%                         |
        | 2nd price details | 0                    | 06/May/Current Academic Year        | 0                      | 06/May/Current Academic Year          | Act2          | 2                   |                             |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Sep/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Oct/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Nov/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Dec/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jan/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Feb/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Mar/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Apr/Current Academic Year | 0            | 0          | 0         | 0                          |
        | May/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jun/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jul/Current Academic Year | 600          | 0          | 0         | 39.25                      |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R10/Current Academic Year | May/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R11/Current Academic Year | Jun/Current Academic Year | 540                    | 60                          | 0                         | Learning                   |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	# New step 
	# Additional field Aim Type is just for readability and not used in the code
	# Note the change in Aim Sequence
    But aims details are changed as follows
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Maths or English | 56789         | 06/May/Current Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| Programme        | ZPROG001      | 06/May/Current Academic Year | 12 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	And price details are changed as follows		
	# Price details
	# Note the 3rd price details
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 1st price details | 9000                 | 06/May/Current Academic Year        | 0                      | 06/May/Current Academic Year          | Act2          | 2                   | 90%                         |
        | 3rd price details | 0                    | 06/May/Current Academic Year        | 0                      | 06/May/Current Academic Year          | Act2          | 1                   |                             |

	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	# New OnProgrammeMathsAndEnglish column
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Sep/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Oct/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Nov/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Dec/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jan/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Feb/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Mar/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Apr/Current Academic Year | 0            | 0          | 0         | 0                          |
        | May/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jun/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | Jul/Current Academic Year | 600          | 0          | 0         | 39.25                      |
	# Check with Devs whether to split R12/Jul Maths/Eng?
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | R10/Current Academic Year | May/Current Academic Year | 600          | 0          | 0         | 0                          |
        | R11/Current Academic Year | Jun/Current Academic Year | 600          | 0          | 0         | 0                          |
        | R12/Current Academic Year | Jul/Current Academic Year | 600          | 0          | 0         | 39.25                      |
        | R12/Current Academic Year | May/Current Academic Year | 0            | 0          | 0         | 39.25                      |
        | R12/Current Academic Year | Jun/Current Academic Year | 0            | 0          | 0         | 39.25                      |        
	# New transaction type and SFA Fully-Funded Payments column
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning                   | 
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | -39.25                    | OnProgrammeMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | -39.25                    | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R12/Current Academic Year | Jul/Current Academic Year | 540                    | 60                          | 0                         | Learning                   | 
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | -39.25                    | OnProgrammeMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | -39.25                    | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Current Academic Year | Jul/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
Examples: 
        | Collection_Period         |
        | R12/Current Academic Year |