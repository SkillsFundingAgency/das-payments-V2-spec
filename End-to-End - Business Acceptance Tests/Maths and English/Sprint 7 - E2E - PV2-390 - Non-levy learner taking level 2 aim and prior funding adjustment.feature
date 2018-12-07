##Learner taking single level 2 aim, prior funding adjustment, completes to time
##Feature: Provider earnings and payments where apprenticeship requires english or maths at level 2 with funding adjustment - COMPLETES ON TIME
#
#Scenario: A Payment for a non-levy learner, funding agreed within band maximum, planned duration is same as programme (assumes both start and finish at same time)
#	
##	Providers are paid £471 per aim. this is funded from outside the total price and is flat-profiled across the planned number of months in learning for that aim. There is no N+1, there is no money held back for completion. 
##	If the learner has english and maths needs above level 2 (apprenticeship requires higher) this is funded within the total price.
#	
##	Tech Guide 102. If an adjustment is required due to prior learning, you must record data in the Funding adjustment for prior learning field on the ILR. 
#
#	When an ILR file is submitted with the following data:
#		  | ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | funding adjustment for prior learning | other funding adjustment | aim type         |
#		  | learner a | 19-24 programme only non-DAS | 15000        | 06/08/2018 | 08/08/2019       |                 | continuing        | n/a                                   | n/a                      | programme        |
#		  | learner a | 19-24 programme only non-DAS | 471          | 06/08/2018 | 08/08/2019       | 08/08/2018      | completed         | 75%                                   | n/a                      | maths or english |
#		  
##    The English or maths aim is submitted with the same start and planned end date
#      
#    Then the provider earnings and payments break down as follows:
#		  | Type                                    | 08/18   | 09/18   | 10/18   | 11/18   | 12/18   | ... | 07/19   | 08/19  |
#		  | Provider Earned Total                   | 1029.44 | 1029.44 | 1029.44 | 1029.44 | 1029.44 | ... | 1029.44 | 0      |
#		  | Provider Paid by SFA                    | 0       | 929.44  | 929.44  | 929.44  | 929.44  | ... | 929.44  | 929.44 |
#		  | Payment due from Employer               | 0       | 100     | 100     | 100     | 100     | ... | 100     | 100    |
#		  | Levy account debited                    | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA levy co-funding budget              | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA Levy employer budget                | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA non-Levy co-funding budget          | 900     | 900     | 900     | 900     | 900     | ... | 900     | 0      |
#		  | SFA non-levy additional payments budget | 29.44   | 29.44   | 29.44   | 29.44   | 29.44   | ... | 29.44   | 0      |
#		  | SFA levy additional payments budget     | 0       | 0       | 0       | 0       | 0       | ... | 0       | 0      |
#		  
#    And the transaction types for the payments are:
#		  | Payment type                   | 09/18 | 10/18 | 11/18 | 12/18 | ... | 07/19 | 08/19 |
#		  | On-program                     | 900   | 900   | 900   | 900   | ... | 900   | 900   |
#		  | Completion                     | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		  | Balancing                      | 0     | 0     | 0     | 0     | ... | 0     | 0     |
#		  | English and maths on programme | 29.44 | 29.44 | 29.44 | 29.44 | ... | 29.44 | 29.44 |
#		  | English and maths Balancing    | 0     | 0     | 0     | 0     | ... | 0     | 0     |

# Check max / 205 for price details and aim sequence changes

Feature: Non-levy learner taking single level 2 aim, prior funding adjustment, completes to time

Scenario Outline: Non-levy learner taking single level 2 aim, prior funding adjustment, completes to time PV2-390
	Given the following learners
        | Learner Reference Number | Uln      |
        | abc123                   | 12345678 |
	And the following aims
		| Aim Reference | Start Date                | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| ZPROG001      | 06/Aug/Last Academic Year | 12 months        |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| 12345         | 06/Aug/Last Academic Year | 12 months        |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	# additional fields | Aim Type         | Aim Rate | funding adjustment for prior learning | other funding adjustment |
	# Check max / 205 for price details and aim sequence changes
	And price details as follows		
        | Price details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage | Aim Type         | Aim Rate | funding adjustment for prior learning | other funding adjustment |
        | 1st price details | 15000                | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   | 90%                         | Programme        |          | n/a                                   | n/a                      |
        | 2nd price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   |                             | Maths or English | 471      | 75%                                   | n/a                      |
    And the following earnings had been generated for the learner
        | Delivery Period        | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Sep/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Oct/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Nov/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Dec/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Jan/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Feb/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Mar/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Apr/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | May/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Jun/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
        | Jul/Last Academic Year | 1000         | 0          | 0         | 29.44                      |
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
        | R01/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R06/Last Academic Year | Jan/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R07/Last Academic Year | Feb/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R08/Last Academic Year | Mar/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R09/Last Academic Year | Apr/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R10/Last Academic Year | May/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R11/Last Academic Year | Jun/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
        | R12/Last Academic Year | Jul/Last Academic Year | 0                      | 0                           | 29.44                     | OnProgrammeMathsAndEnglish |
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