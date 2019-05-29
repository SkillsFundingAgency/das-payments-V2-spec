Feature: Non-levy learner completes maths and english early PV2-485

Scenario Outline: Non-levy learner completes maths and english early PV2-485
	Given the following learners
        | Learner Reference Number |
        | abc123                   |
	And the following aims
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | Completion Status |
		| Programme        | ZPROG001      | 06/Aug/Current Academic Year | 12 months        |                 | 1                   | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | continuing        |
		| Maths or English | 50114979      | 06/Aug/Current Academic Year | 12 months        |                 | 2                   | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | continuing        |
	And price details as follows		
        | Price Episode Id | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | pe-1             | 15000                | 06/Aug/Current Academic Year        |                        |                                       | Act2          | 1                   | 90%                         |
        |                  | 0                    | 06/Aug/Current Academic Year        |                        |                                       | Act2          | 2                   | 100%                        |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish | Aim Sequence Number | Price Episode Identifier |
		# pe-1
        | Aug/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Sep/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Oct/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Nov/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Dec/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Jan/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Feb/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Mar/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Apr/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | May/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Jun/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
        | Jul/Current Academic Year | 1000         | 0          | 0         | 0                          | 1                   | pe-1                     |
		# Maths/Eng
        | Aug/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Sep/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Oct/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Nov/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Dec/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Jan/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Feb/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Mar/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Apr/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | May/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Jun/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
        | Jul/Current Academic Year | 0            | 0          | 0         | 39.25                      | 2                   |                          |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R08/Current Academic Year | Mar/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R09/Current Academic Year | Apr/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R10/Current Academic Year | May/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R08/Current Academic Year | Mar/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R09/Current Academic Year | Apr/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R10/Current Academic Year | May/Current Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
    But aims details are changed as follows
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type                               | Completion Status |
		| Programme        | ZPROG001      | 06/Aug/Current Academic Year | 12 months        |                 | 1                   | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | continuing        |
		| Maths or English | 50114979      | 06/Aug/Current Academic Year | 12 months        | 10 months       | 2                   | 593            | 1            | 20             | 19+ Apprenticeship Non-Levy Contract (procured) | completed         |
	And price details are changed as follows		
        | Price Episode Id | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | pe-1             | 15000                | 06/Aug/Current Academic Year        |                        |                                       | Act2          | 1                   | 90%                         |
        |                  | 0                    | 06/Aug/Current Academic Year        |                        |                                       | Act2          | 2                   | 100%                        |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish | BalancingMathsAndEnglish | Aim Sequence Number | Price Episode Identifier |
		# pe-1
        | Aug/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Sep/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Oct/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Nov/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Dec/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Jan/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Feb/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Mar/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Apr/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | May/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Jun/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
        | Jul/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        | 1                   | pe-1                     |
		# Maths/Eng
        | Aug/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Sep/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Oct/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Nov/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Dec/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Jan/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Feb/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Mar/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Apr/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | May/Current Academic Year | 0            | 0          | 0         | 39.25                      | 0                        | 2                   |                          |
        | Jun/Current Academic Year | 0            | 0          | 0         | 0                          | 78.50                    | 2                   |                          |
        | Jul/Current Academic Year | 0            | 0          | 0         | 0                          | 0                        | 2                   |                          |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish | BalancingMathsAndEnglish |
        | R11/Current Academic Year | Jun/Current Academic Year | 1000         | 0          | 0         | 0                          | 78.50                    |
        | R12/Current Academic Year | Jul/Current Academic Year | 1000         | 0          | 0         | 0                          | 0                        |
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | 0                         | Learning                 |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | 0                         | Learning                 |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 78.50                     | BalancingMathsAndEnglish |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type         |
        | R11/Current Academic Year | Jun/Current Academic Year | 900                    | 100                         | 0                         | Learning                 |
        | R12/Current Academic Year | Jul/Current Academic Year | 900                    | 100                         | 0                         | Learning                 |
        | R11/Current Academic Year | Jun/Current Academic Year | 0                      | 0                           | 78.50                     | BalancingMathsAndEnglish |

Examples: 
        | Collection_Period         |
        | R11/Current Academic Year |
        | R12/Current Academic Year |

#Feature: Provider earnings and payments where apprenticeship requires english or maths above level 2 - completes maths and english early.
#
#Scenario: A Payment for a non-levy learner, funding agreed within band maximum, planned duration is same as programme, completes Maths & English early
#
#Given the apprenticeship funding band maximum is 15000
#When an ILR file is submitted with the following data:
#		  | ULN       | Employer   | Provider   | learner type                 | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim rate |
#		  | learner a | employer 0 | provider A | 19-24 programme only non-DAS | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | programme        |          |
#		  | learner a | employer 0 | provider A | 19-24 programme only non-DAS |              | 06/08/2018 | 08/08/2019       | 08/06/2019      | completed         | maths or english | 471      |
#		  
#      
#Then the provider earnings and payments break down as follows:
#
#		  | Type                                    | 08/18   | 09/18   | 10/18   | ... | 04/19   | 05/19   | 06/19   | 07/19   | 08/19   |
#		  | Provider Earned Total                   | 1039.25 | 1039.25 | 1039.25 | ... | 1039.25 | 1039.25 | 1078.50 | 1000    | 0       |
#      	  | Provider Earned from SFA                | 939.25  | 939.25  | 939.25  | ... | 939.25  | 939.25  | 978.50  | 900     | 0       |
#          | Provider Earned from Employer           | 100     | 100     | 100     | ... | 100     | 100     | 100     | 100     | 0       |
#		  | Provider Paid by SFA                    | 0       | 939.25  | 939.25  | ... | 939.25  | 939.25  | 939.25  | 978.50  | 900     |
#		  | Payment due from Employer               | 0       | 100     | 100     | ... | 100     | 100     | 100     | 100     | 100     |
#		  | Levy account debited                    | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0       |
#		  | SFA Levy employer budget                | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0       |
#		  | SFA levy co-funding budget              | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0       |
#		  | SFA non-levy co-funding budget          | 900     | 900     | 900     | ... | 900     | 900     | 900     | 900     | 0       |
#		  | SFA non-Levy additional payments budget | 39.25   | 39.25   | 39.25   | ... | 39.25   | 39.25   | 78.50   | 0       | 0       |
#		  | SFA levy additional payments budget     | 0       | 0       | 0       | ... | 0       | 0       | 0       | 0       | 0       |
#		  
#And the transaction types for the payments are:
#
#		  | Payment type                   | 09/18 | 10/18 | ... | 05/19 | 06/19 | 07/19 | 08/19 |
#		  | On-program                     | 900   | 900   | ... | 900   | 900   | 900   | 900   |
#		  | Completion                     | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#		  | Balancing                      | 0     | 0     | ... | 0     | 0     | 0     | 0     |
#		  | English and maths on programme | 39.25 | 39.25 | ... | 39.25 | 39.25 | 0     | 0     |
#		  | English and maths balancing    | 0     | 0     | ... | 0     | 0     | 78.50 | 0     |