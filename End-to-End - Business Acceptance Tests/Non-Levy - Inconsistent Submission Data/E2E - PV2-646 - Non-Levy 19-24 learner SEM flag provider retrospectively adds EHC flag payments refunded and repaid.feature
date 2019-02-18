#Feature: Inconsistent Submission Data
#
#Scenario: 19-24 year old Non-Levy apprentice, small employer flag added, provider retrospectively adds Education Health Care (EHC) plan flag in the ILR, previous on-programme payments are refunded and repaid according to latest EHC plan status
#
#		Given The learner is programme only non-DAS
#        And the apprenticeship funding band maximum is 9000
#		And total price is 9000
#
#        And the ILR has been submitted on 30/09/2018 with the following data:
#  
#            | ULN       | learner type                 | start date | aim sequence number | aim type  | completion status | framework code | programme type | pathway code | Employment Status	| Employment Status Applies | Employer Id | Small Employer | LearnDelFam |
#            | learner a | 19-24 programme only non-DAS | 06/08/2018 | 1                   | programme | continuing        | 403            | 2              | 1            | In paid employment	| 05/08/2018	            | 12345678    |	SEM1           | No value    |
#
#		       
#        When an ILR file is submitted on 31/10/18 with the following data:
#            | ULN       | learner type                 | start date | aim sequence number | aim type  | completion status | framework code | programme type | pathway code | Employment Status	| Employment Status Applies | Employer Id | Small Employer | LearnDelFam |
#            | learner a | 19-24 programme only non-DAS | 06/08/2018 | 1                   | programme | continuing        | 403            | 2              | 1            | In paid employment	| 05/08/2018	            | 12345678    |	SEM1           | EEF2        |
#        
#  
#        Then the provider earnings and payments break down as follows:
#            | Type                                    | 08/17  | 09/17  | 10/17  | 11/17  | 
#            | Provider Earned Total                   | 600    | 600    | 600    | 0      | 
#            | Provider Earned from SFA                | 600    | 600    | 600    | 0      | 
#            | Provider Earned from Employer           | 0      | 0      | 0      | 0      | 
#            | Provider Paid by SFA                    | 0      | 540    | 540    | 1800   | 
#            | Refund taken by SFA                     | 0      | 0      | 0      | -1080  | 
#            | Payment due from Employer               | 0      | 60     | 60     | 0      | 
#            | Refund due to employer                  | 0      | 0      | 0      | 120    | 
#            | Levy account debited                    | 0      | 0      | 0      | 0      | 
#            | Levy account credited                   | 0      | 0      | 0      | 0      | 
#            | SFA Levy employer budget                | 0      | 0      | 0      | 0      | 
#            | SFA Levy co-funding budget              | 0      | 0      | 0      | 0      | 
#            | SFA Levy additional payments budget     | 0      | 0      | 0      | 0      | 
#            | SFA non-Levy co-funding budget          | 600    | 600    | 600    | 0      | 
#            | SFA non-Levy additional payments budget | 0      | 0      | 0      | 0      |  

# DC integration
#| Employment Status  | Employment Status Applies | Employer Id | Small Employer | LearnDelFam |
#| In paid employment | 05/08/2018                | 12345678    | SEM1           | No value    |
#| In paid employment | 05/08/2018                | 12345678    | SEM1           | EEF2        |

Feature: Inconsistent Submission Data
	As a provider,
	I want a 19-24 yr old Non levy learner, where the small employer flag is added but the Education Health Care (EHC) plan flag is added retrospectively to the ILR, and previous on-programme payments are refunded and repaid according to the latest EHC plan status
	So that I am accurately paid the apprenticeship amount by SFA

Scenario Outline: Non-Levy 19-24 learner SEM flag provider retrospectively adds EHC flag payments refunded and repaid PV2-646
19-24 year old Non-Levy apprentice, small employer flag added, provider retrospectively adds Education Health Care (EHC) plan flag in the ILR, previous on-programme payments are refunded and repaid according to latest EHC plan status
	Given the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                      | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract | 90%                         |
	And the following earnings had been generated
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 600          | 0          | 0         |
        | Sep/Current Academic Year | 600          | 0          | 0         |
        | Oct/Current Academic Year | 600          | 0          | 0         |
        | Nov/Current Academic Year | 600          | 0          | 0         |
        | Dec/Current Academic Year | 600          | 0          | 0         |
        | Jan/Current Academic Year | 600          | 0          | 0         |
        | Feb/Current Academic Year | 600          | 0          | 0         |
        | Mar/Current Academic Year | 600          | 0          | 0         |
        | Apr/Current Academic Year | 600          | 0          | 0         |
        | May/Current Academic Year | 600          | 0          | 0         |
        | Jun/Current Academic Year | 600          | 0          | 0         |
        | Jul/Current Academic Year | 600          | 0          | 0         |
    And the following provider payments had been generated 
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R01/Current Academic Year | Aug/Current Academic Year | 540                    | 60                          | Learning         |
        | R02/Current Academic Year | Sep/Current Academic Year | 540                    | 60                          | Learning         |
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                      | SFA Contribution Percentage |
		| 06/Aug/Current Academic Year | 12 months        | 9000                 | 06/Aug/Current Academic Year        | 0                      | 06/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 593            | 1            | 20             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract | 100%                        |
	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 600          | 0          | 0         |
        | Sep/Current Academic Year | 600          | 0          | 0         |
        | Oct/Current Academic Year | 600          | 0          | 0         |
        | Nov/Current Academic Year | 600          | 0          | 0         |
        | Dec/Current Academic Year | 600          | 0          | 0         |
        | Jan/Current Academic Year | 600          | 0          | 0         |
        | Feb/Current Academic Year | 600          | 0          | 0         |
        | Mar/Current Academic Year | 600          | 0          | 0         |
        | Apr/Current Academic Year | 600          | 0          | 0         |
        | May/Current Academic Year | 600          | 0          | 0         |
        | Jun/Current Academic Year | 600          | 0          | 0         |
        | Jul/Current Academic Year | 600          | 0          | 0         |
    And at month end only the following payments will be calculated
        | Collection Period         | Delivery Period           | On-Programme | Completion | Balancing |
        | R03/Current Academic Year | Aug/Current Academic Year | -600         | 0          | 0         |
        | R03/Current Academic Year | Sep/Current Academic Year | -600         | 0          | 0         |
        | R03/Current Academic Year | Aug/Current Academic Year | 600          | 0          | 0         |
        | R03/Current Academic Year | Sep/Current Academic Year | 600          | 0          | 0         |
        | R03/Current Academic Year | Oct/Current Academic Year | 600          | 0          | 0         |
        | R04/Current Academic Year | Nov/Current Academic Year | 600          | 0          | 0         |
	And only the following provider payments will be recorded
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Aug/Current Academic Year | -540                   | -60                         | Learning         |
        | R03/Current Academic Year | Sep/Current Academic Year | -540                   | -60                         | Learning         |
        | R03/Current Academic Year | Aug/Current Academic Year | 600                    | 0                           | Learning         |
        | R03/Current Academic Year | Sep/Current Academic Year | 600                    | 0                           | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 600                    | 0                           | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 600                    | 0                           | Learning         |
	And only the following provider payments will be generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type |
        | R03/Current Academic Year | Aug/Current Academic Year | -540                   | -60                         | Learning         |
        | R03/Current Academic Year | Sep/Current Academic Year | -540                   | -60                         | Learning         |
        | R03/Current Academic Year | Aug/Current Academic Year | 600                    | 0                           | Learning         |
        | R03/Current Academic Year | Sep/Current Academic Year | 600                    | 0                           | Learning         |
        | R03/Current Academic Year | Oct/Current Academic Year | 600                    | 0                           | Learning         |
        | R04/Current Academic Year | Nov/Current Academic Year | 600                    | 0                           | Learning         |
Examples: 
        | Collection_Period         |
        | R03/Current Academic Year |
		| R04/Current Academic Year |	