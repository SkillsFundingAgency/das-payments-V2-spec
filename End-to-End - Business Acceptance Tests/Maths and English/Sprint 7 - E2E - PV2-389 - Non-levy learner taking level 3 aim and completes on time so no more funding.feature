#Learner taking single level 3 aim, completes to time, no funding generated     
#
##Feature: Provider earnings and payments where apprenticeship requires english or maths above level 2 - completes on time.
#
#
#Scenario: A Payment for a non-levy learner, funding agreed within band maximum, planned duration is same as programme (assumes both start and finish at same time)
#
#Given the apprenticeship funding band maximum is 15000
#When an ILR file is submitted with the following data:
#		  | ULN       | Employer   | Provider   | learner type                 | agreed price | start date | planned end date | actual end date | completion status | aim type         | aim rate |
#		  | learner a | employer 0 | provider A | 19-24 programme only non-DAS | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | programme        |          |
#		  | learner a | employer 0 | provider A | 19-24 programme only non-DAS |              | 06/08/2018 | 08/08/2019       | 08/08/2019      | completed         | maths or english | 471      |
#		  
#      
#Then the provider earnings and payments break down as follows:
#
#		  | Type                                    | 08/18   | 09/18   | 10/18   | 11/18   | 12/18   | ... | 07/19   | 08/19   |
#		  | Provider Earned Total                   | 1039.25 | 1039.25 | 1039.25 | 1039.25 | 1039.25 | ... | 1039.25 | 0       |
#		  | Provider Paid by SFA                    | 0       | 939.25  | 939.25  | 939.25  | 939.25  | ... | 939.25  | 939.25  |
#		  | Payment due from Employer               | 0       | 100     | 100     | 100     | 100     | ... | 100     | 100     |
#		  | Levy account debited                    | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0       |
#		  | SFA Levy employer budget                | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0       |
#		  | SFA levy co-funding budget              | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0       |
#		  | SFA non-levy co-funding budget          | 900     | 900     | 900     | 900     | 900     | ... | 900     | 0       |
#		  | SFA non-Levy additional payments budget | 39.25   | 39.25   | 39.25   | 39.25   | 39.25   | ... | 39.25   | 0       |
#		  | SFA levy additional payments budget     | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0       |
#		  
#And the transaction types for the payments are:
#
#		  | Payment type                   | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 |
#		  | On-program                     | 900   | 900   | 900   | 900   | ... | 900   | 900   |
#		  | Completion                     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		  | Balancing                      | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		  | English and maths on programme | 39.25 | 39.25 | 39.25 | 39.25 | ... | 39.25 | 39.25 |
#		  | English and maths balancing    | 0     | 0     | 0     | 0     | ... | 0     | 0     |

# Check max / 205 for price details and aim sequence changes

Feature: Non-levy learner, provider changes aim sequence numbers after payments have already occurred

Scenario Outline: Non-levy learner taking level 3 aim and completes on time so no more funding PV2-389
	Given the following learners
        | Learner Reference Number | Uln      |
        | abc123                   | 12345678 |
	And the following aims
		| Aim Reference | Start Date                | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| ZPROG001      | 06/Aug/Last Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| 12345         | 06/Aug/Last Academic Year | 12 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	# additional fields | Aim Type         | Aim Rate |
	# Check max / 205 for price details and aim sequence changes
	And price details as follows		
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage | Aim Type         | Aim Rate |
        | 1st price details | 15000                | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   | 90%                         | Programme        |          |
        | 2nd price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   |                             | Maths or English | 471      |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Sep/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Oct/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Nov/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Dec/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Jan/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Feb/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Mar/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Apr/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | May/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Jun/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
        | Jul/Last Academic Year | 1000         | 0          | 0         | 39.25                      |
    And the following provider payments had been generated
        | Collection Period      | Delivery Period        | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Last Academic Year | Aug/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R02/Last Academic Year | Sep/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R03/Last Academic Year | Oct/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R04/Last Academic Year | Nov/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R05/Last Academic Year | Dec/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R06/Last Academic Year | Jan/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R07/Last Academic Year | Feb/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R08/Last Academic Year | Mar/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R09/Last Academic Year | Apr/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R10/Last Academic Year | May/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R11/Last Academic Year | Jun/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R12/Last Academic Year | Jul/Last Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R01/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R06/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R07/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R08/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R09/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R10/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R11/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R12/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	# New steps with additional fields
    But aims details are changed as follows
		| Aim Reference | Start Date                | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| ZPROG001      | 06/Aug/Last Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| 12345         | 06/Aug/Last Academic Year | 12 months        | 12 months       | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | completed         |
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
        | May/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jun/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jul/Current Academic Year | 0            | 0          | 0         | 0                          |

	And no provider payments will be recorded

Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |