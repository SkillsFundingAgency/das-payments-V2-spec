#Feature: Inconsistent Submission Data
#			
#Scenario: 19-24 year old Levy apprentice, small employer flag added, provider retrospectively adds care leaver flag in the ILR, previous on-programme payments are refunded and repaid according to latest care leaver status
#
#		Given The learner is programme only DAS
#        And levy balance > agreed price for all months
#        And the apprenticeship funding band maximum is 9000
#		And the agreed price is 9000
#
#       And the ILR has been submitted on 30/09/2018 with the following data:
#  
#            | ULN       | learner type             | start date | aim sequence number | aim type  | completion status | framework code | programme type | pathway code | Employment Status	| Employment Status Applies | Employer Id | Small Employer | LearnDelFam |
#            | learner a | 19-24 programme only DAS | 06/08/2018 | 1                   | programme | continuing        | 403            | 2              | 1            | In paid employment	| 05/08/2018	            | 12345678    |	SEM1           | No value    |
#        
#			       
#        When an ILR file is submitted on 31/10/18 with the following data:
#            | ULN       | learner type             | start date | aim sequence number | aim type  | completion status | framework code | programme type | pathway code | Employment Status	| Employment Status Applies | Employer Id | Small Employer | LearnDelFam |
#            | learner a | 19-24 programme only DAS | 06/08/2018 | 1                   | programme | continuing        | 403            | 2              | 1            | In paid employment	| 05/08/2018	            | 12345678    |	SEM1           | EEF4        |
#        
#  
#        Then the provider earnings and payments break down as follows:
#            | Type                                    | 08/18  | 09/18  | 10/18  | 11/18  | 
#            | Provider Earned Total                   | 600    | 600    | 600    | 0      | 
#            | Provider Earned from SFA                | 600    | 600    | 600    | 0      | 
#            | Provider Earned from Employer           | 0      | 0      | 0      | 0      | 
#            | Provider Paid by SFA                    | 0      | 600    | 600    | 1800   | 
#            | Refund taken by SFA                     | 0      | 0      | 0      | -1200  | 
#            | Payment due from Employer               | 0      | 0      | 0      | 0      | 
#            | Refund due to employer                  | 0      | 0      | 0      | 0      | 
#            | Levy account debited                    | 0      | 600    | 600    | 0      | 
#            | Levy account credited                   | 0      | 0      | 0      | 1200   | 
#            | SFA Levy employer budget                | 0      | 0      | 0      | 0      | 
#            | SFA Levy co-funding budget              | 600    | 600    | 600    | 0      | 
#            | SFA Levy additional payments budget     | 0      | 0      | 0      | 0      | 
#            | SFA non-Levy co-funding budget          | 0      | 0      | 0      | 0      | 
#			 | SFA non-Levy additional payments budget | 0      | 0      | 0      | 0      |  

Feature: Inconsistent Submission Data
As a provider,
I want a 19-24 yr old Levy learner, where the small employer flag is added but the care leaver flag is added retrospectively to the ILR, and previous on-programme payments are refunded and repaid according to the latest care leaver status
So that I am accurately paid the apprenticeship amount by SFA PV2-654

Scenario: 19-24 year old Levy apprentice, small employer flag added, provider retrospectively adds care leaver flag in the ILR, previous on-programme payments are refunded and repaid according to latest care leaver status PV2-654
 # And the employment status in the ILR is
 #       | Employer   | Employment Status  | Employment Status Applies	  | Small Employer |
 #       | employer 1 | in paid employment | 05/Aug/Current Academic Year | SEM1           |


Given the employer levy account balance in collection period R06/Current Academic Year is 15000

And the following commitments exist

	| start date                   | end date                     | agreed price |
	| 01/Aug/Current Academic Year | 31/Jul/Current Academic Year | 9000         |
# Please note: New field added - "LearnDelFam"
And the provider previously submitted the following learner details 
    | Priority | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price | Total Assesment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | LearnDelFam | Funding Line Type                                  |
    | 1        | 04/Aug/Current Academic Year | 12 months        | 8000                 | 01/Aug/Current Academic Year        | 1000                  | 01/Aug/Current Academic Year         |                 | continuing        | 90%                         | Act1          | 1                   | ZPROG001      | 17            | 25             | No value    | 19-24 Apprenticeship (From May 2017) Levy Contract |

And the following earnings had been generated for the learner
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
    | Collection Period         | Delivery Period           | Levy Payments | Transaction Type |
    | R01/Current Academic Year | Aug/Current Academic Year | 600           | Learning         |
    | R02/Current Academic Year | Sep/Current Academic Year | 600           | Learning         |
    | R03/Current Academic Year | Oct/Current Academic Year | 600           | Learning         |
    | R04/Current Academic Year | Nov/Current Academic Year | 600           | Learning         |
    | R05/Current Academic Year | Dec/Current Academic Year | 600           | Learning         |
    
But the Provider now changes the Learner details as follows
    | Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assesment Price Effective Date | Actual Duration | Completion Status | SFA Contribution Percentage | Contract Type | Aim Sequence Number | Aim Reference | Standard Code | Programme Type | LearnDelFam | Funding Line Type                                  |
    | 04/Aug/Current Academic Year | 12 months        | 9000                 | 01/Aug/Current Academic Year        | 01/Aug/Current Academic Year         |                 | continuing        | 100%                        | Act1          | 1                   | ZPROG001      | 17            | 25             | EEF4        | 19-24 Apprenticeship (From May 2017) Levy Contract |
	 
When the amended ILR file is re-submitted for the learners in collection period R06/Current Academic Year

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
    | R06/Current Academic Year | Aug/Current Academic Year | -600         | 0          | 0         |
    | R06/Current Academic Year | Sep/Current Academic Year | -600         | 0          | 0         |
    | R06/Current Academic Year | Oct/Current Academic Year | -600         | 0          | 0         |
    | R06/Current Academic Year | Nov/Current Academic Year | -600         | 0          | 0         |
    | R06/Current Academic Year | Dec/Current Academic Year | -600         | 0          | 0         |
    | R06/Current Academic Year | Aug/Current Academic Year | 600          | 0          | 0         |
    | R06/Current Academic Year | Sep/Current Academic Year | 600          | 0          | 0         |
    | R06/Current Academic Year | Oct/Current Academic Year | 600          | 0          | 0         |
    | R06/Current Academic Year | Nov/Current Academic Year | 600          | 0          | 0         |
    | R06/Current Academic Year | Dec/Current Academic Year | 600          | 0          | 0         |
    | R06/Current Academic Year | Jan/Current Academic Year | 600          | 0          | 0         |

And only the following provider payments will be recorded
    | Collection Period         | Delivery Period           | SFA Fully-Funded Payments | Levy Payments | Transaction Type |
    | R06/Current Academic Year | Aug/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Sep/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Oct/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Nov/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Dec/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Aug/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Sep/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Oct/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Nov/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Dec/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Jan/Current Academic Year | 600                       | 0             | Learning         |

And only the following provider payments will be generated
    | Collection Period         | Delivery Period           | SFA Fully-Funded Payments | Levy Payments | Transaction Type |
    | R06/Current Academic Year | Aug/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Sep/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Oct/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Nov/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Dec/Current Academic Year | 0                         | -600          | Learning         |
    | R06/Current Academic Year | Aug/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Sep/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Oct/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Nov/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Dec/Current Academic Year | 600                       | 0             | Learning         |
    | R06/Current Academic Year | Jan/Current Academic Year | 600                       | 0             | Learning         |