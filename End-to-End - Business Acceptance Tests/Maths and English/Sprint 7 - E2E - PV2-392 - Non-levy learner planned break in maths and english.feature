##Feature: Provider earnings and payments where apprenticeship requires english or maths at level 2 with prior funding adjustment after break - COMPLETES ON TIME, RETURNS TO SAME PROVIDER
#
#Scenario: A Payment for a non-DAS learner, funding agreed within band maximum, planned duration is same as programme (assumes both start and finish at same time), prior funding adjustment is 42%
#	
##	Providers are paid £471 per aim. this is funded from outside the total proce and is flat-profiled across the planned number of months in learning for that aim. There is no N+1, there is no money held back for completion. 
#
##	Tech Guide 102. If an adjustment is required due to prior learning, you must record data in the Funding adjustment for prior learning field on the ILR. 
#
#	When an ILR file is submitted with the following data:
#		  | ULN       | learner type                 | agreed price | start date | planned end date | actual end date | completion status | funding adjustment for prior learning | other funding adjustment | restart indicator | aim type         |
#		  | learner a | 19-24 programme only non-DAS | 15000        | 06/08/2018 | 08/08/2019       | 08/01/2019      | planned break     | n/a                                   | n/a                      | NO                | programme        |
#		  | learner a | 19-24 programme only non-DAS | 471          | 06/08/2018 | 08/08/2019       | 08/01/2019      | planned break     | n/a                                   | n/a                      | NO                | maths or english |
#		  | learner a | 19-24 programme only non-DAS | 15000        | 06/08/2019 | 08/03/2020       |                 | continuing        | n/a                                   | n/a                      | YES               | programme        |
#		  | learner a | 19-24 programme only non-DAS | 471          | 06/08/2019 | 08/03/2020       | 08/03/2020      | completed         | 42%                                   | n/a                      | YES               | maths or english |
#		  
##	The English or maths aim is submitted with the same start and planned end date
#     
#    Then the provider earnings and payments break down as follows:
#		  | Type                                    | 08/18   | 09/18   | 10/18   | 11/18   | 12/18   | 01/19  | ... | 08/19   | 09/19   | 10/19   | ... | 02/20   | 03/20  |
#		  | Provider Earned Total                   | 1039.25 | 1039.25 | 1039.25 | 1039.25 | 1039.25 | 0      | ... | 1028.26 | 1028.26 | 1028.26 | ... | 1028.26 | 0      |
#		  | Provider Paid by SFA                    | 0       | 939.25  | 939.25  | 939.25  | 939.25  | 939.25 | ... | 0       | 928.26  | 928.26  | ... | 928.26  | 928.26 |
#		  | Payment due from Employer               | 0       | 100     | 100     | 100     | 100     | 100    | ... | 0       | 100     | 100     | ... | 100     | 100    |
#		  | Levy account debited                    | 0       | 0       | 0       | 0       | 0       | 0      | ... | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA Levy employer budget                | 0       | 0       | 0       | 0       | 0       | 0      | ... | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA Levy co-funding budget              | 0       | 0       | 0       | 0       | 0       | 0      | ... | 0       | 0       | 0       | ... | 0       | 0      |
#		  | SFA non-Levy co-funding budget          | 900     | 900     | 900     | 900     | 900     | 0      | ... | 900     | 900     | 900     | ... | 900     | 0      |
#		  | SFA non-levy additional payments budget | 39.25   | 39.25   | 39.25   | 39.25   | 39.25   | 0      | ... | 28.26   | 28.26   | 28.26   | ... | 28.26   | 0      |
#		  | SFA levy additional payments budget     | 0       | 0       | 0       | 0       | 0       | 0      | ... | 0       | 0       | 0       | ... | 0       | 0      |
#		  
#    And the transaction types for the payments are:
#		  | Payment type                   | 09/18 | 10/18 | 11/18 | 12/18 | 01/19 | ... | 09/19 | 10/19 | 11/19 | ... | 02/20 | 03/20 |
#		  | On-program                     | 900   | 900   | 900   | 900   | 900   | ... | 900   | 900   | 900   | ... | 900   | 900   |
#		  | Completion                     | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     | 0     |
#		  | Balancing                      | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     | 0     |
#		  | English and maths on programme | 39.25 | 39.25 | 39.25 | 39.25 | 39.25 | ... | 28.26 | 28.26 | 28.26 | ... | 28.26 | 28.26 |
#		  | English and maths Balancing    | 0     | 0     | 0     | 0     | 0     | ... | 0     | 0     | 0     | ... | 0     | 0     |
		  

# Remaining 42% (197.82) is divided into remaining 7 months - Hence 28.26
# Restart Indicator
#For DC Integration
 #| Funding Adjustment For Prior Learning |
 #| n/a                                   |
 #| 42% for remaining period|
	
# New template
Feature: Non-levy learner, requires english or maths at level 2 with prior funding adjustment after break - COMPLETES ON TIME, RETURNS TO SAME PROVIDER

Scenario Outline: Non-levy learner, requires english or maths at level 2 with prior funding adjustment after break PV2-392
	Given the following learners
        | Learner Reference Number | Uln      |
        | abc123                   | 12345678 |
	# New field - Aim Type
	And the following aims
		| Aim Type         | Aim Reference | Start Date                | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Maths or English | 12345         | 06/Aug/Last Academic Year | 12 months        | 5 months        | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | planned break     |
		| Programme        | ZPROG001      | 06/Aug/Last Academic Year | 12 months        | 5 months        | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | planned break     |
	And price details as follows	
	# Price details
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 1st price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   |                             |
        | 2nd price details | 15000                | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   | 90%                         |
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
        | R01/Last Academic Year | Aug/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R02/Last Academic Year | Sep/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R03/Last Academic Year | Oct/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R04/Last Academic Year | Nov/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
        | R05/Last Academic Year | Dec/Last Academic Year | 0                      | 0                           | 39.25                     | OnProgrammeMathsAndEnglish |
	# Note - Planned duration shorten after planned break
    But aims details are changed as follows
		| Aim Type         | Aim Reference | Start Date                   | Planned Duration | Actual Duration | Aim Sequence Number | Framework Code | Pathway Code | Programme Type | Funding Line Type             | Completion Status |
		| Maths or English | 12345         | 06/Aug/Current Academic Year | 7 months         |                 | 1                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
		| Programme        | ZPROG001      | 06/Aug/Current Academic Year | 7 months         |                 | 2                   | 403            | 1            | 2              | 16-18 Apprenticeship Non-Levy | continuing        |
	# New step 
	# Note the new price details
	And price details are changed as follows		
        | Price Details     | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Contract Type | Aim Sequence Number | SFA Contribution Percentage |
        | 3rd price details | 0                    | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 1                   |                             |
        | 4th price details | 15000                | 06/Aug/Last Academic Year           | 0                      | 06/Aug/Last Academic Year             | Act2          | 2                   | 90%                         |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	# New OnProgrammeMathsAndEnglish column
    Then the following learner earnings should be generated
        | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | Aug/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Sep/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Oct/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Nov/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Dec/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Jan/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Feb/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | Mar/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Apr/Current Academic Year | 0            | 0          | 0         | 0                          |
        | May/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jun/Current Academic Year | 0            | 0          | 0         | 0                          |
        | Jul/Current Academic Year | 0            | 0          | 0         | 0                          |
    And only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | OnProgrammeMathsAndEnglish |
        | R01/Current Academic Year | Aug/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R02/Current Academic Year | Sep/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R03/Current Academic Year | Oct/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R04/Current Academic Year | Nov/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R05/Current Academic Year | Dec/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R06/Current Academic Year | Jan/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
        | R07/Current Academic Year | Feb/Current Academic Year | 1000         | 0          | 0         | 28.26                      |
	# New transaction type and SFA Fully-Funded Payments column
    And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
	And at month end only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | SFA Fully-Funded Payments | Transaction Type           |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R04/Current Academic Year | Nov/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R05/Current Academic Year | Dec/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R06/Current Academic Year | Jan/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R07/Current Academic Year | Feb/Current Academic Year | 900                    | 100                         | 0                         | Learning                   |
        | R01/Current Academic Year | Aug/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R02/Current Academic Year | Sep/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R03/Current Academic Year | Oct/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R04/Current Academic Year | Nov/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R05/Current Academic Year | Dec/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R06/Current Academic Year | Jan/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
        | R07/Current Academic Year | Feb/Current Academic Year | 0                      | 0                           | 28.26                     | OnProgrammeMathsAndEnglish |
Examples: 
        | Collection_Period         |
        | R01/Current Academic Year |
        | R02/Current Academic Year |
        | R03/Current Academic Year |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |