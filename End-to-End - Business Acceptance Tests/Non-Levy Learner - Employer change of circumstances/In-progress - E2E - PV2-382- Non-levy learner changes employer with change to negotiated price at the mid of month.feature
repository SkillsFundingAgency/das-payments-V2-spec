#Scenario: Earnings and payments for a non-levy learner and there is a change to the Negotiated Cost which happens mid month
#        Given The learner is programme only Non-DAS        
#        And the learner changes employers
#            | Employer   | Type     | ILR employment start date |
#            | employer 1 | Non-DAS  | 04/08/2018                |
#            | employer 2 | Non-DAS  | 10/11/2018                |
#        
#        When an ILR file is submitted on 03/12/2018 with the following data:
#            | ULN       | start date | planned end date | actual end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date | Residual training price | Residual training price effective date | Residual assessment price | Residual assessment price effective date |
#            | learner a | 04/08/2018 | 04/08/2019       |                 | continuing        | 12000                | 04/08/2018                          | 3000                   | 04/08/2018                            | 5000                    | 10/11/2018                             | 625                       | 10/11/2018                               |
#        
#        Then the provider earnings and payments break down as follows:
#            
#            | Type                            | 08/18 | 09/18 | 10/18 | 11/18 | 12/18 |
#            | Provider Earned Total           | 1000  | 1000  | 1000  | 500   | 500   |
#            | Provider Earned from SFA        | 900   | 900   | 900   | 450   | 450   |
#            | Provider Earned from Employer 1 | 100   | 100   | 100   | 0     | 0     |
#            | Provider Earned from Employer 2 | 0     | 0     | 0     | 50    | 50    |
#            | Provider Paid by SFA            | 0     | 900   | 900   | 900   | 450   |
#            | Payment due from employer 1     | 0     | 100   | 100   | 100   | 0     |
#            | Payment due from employer 2     | 0     | 0     | 0     | 0     | 50    |
#            | Employer 1 Levy account debited | 0     | 0     | 0     | 0     | 0     |
#            | Employer 2 Levy account debited | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy employer budget        | 0     | 0     | 0     | 0     | 0     |
#            | SFA Levy co-funding budget      | 900   | 900   | 900   | 450   | 450   |
                

Feature: Non-levy learner changes employer with change to negotiated price at mid of month
  	# Review new column in payments tables
	# Check the start date and duration for residual training
	# New table for employment status
Scenario Outline: Non-levy learner changes employer with change to negotiated price at mid of month PV2-382
	Given the provider previously submitted the following learner details
		| Start Date                   | Planned Duration | Total Training Price | Total Training Price Effective Date | Total Assessment Price | Total Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 04/Aug/Current Academic Year | 12 months        | 12000                | 04/Aug/Current Academic Year        | 3000                   | 04/Aug/Current Academic Year          |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies    | Small Employer |
        | employer 1 | in paid employment | 04/Aug/Current Academic Year |                |
    And the following earnings had been generated for the learner
        | Delivery Period           | On-Programme | Completion | Balancing |
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 1000         | 0          | 0         |
        | Dec/Current Academic Year | 1000         | 0          | 0         |
        | Jan/Current Academic Year | 1000         | 0          | 0         |
        | Feb/Current Academic Year | 1000         | 0          | 0         |
        | Mar/Current Academic Year | 1000         | 0          | 0         |
        | Apr/Current Academic Year | 1000         | 0          | 0         |
        | May/Current Academic Year | 1000         | 0          | 0         |
        | Jun/Current Academic Year | 1000         | 0          | 0         |
        | Jul/Current Academic Year | 1000         | 0          | 0         |
    And the following provider payments had been generated
        | Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Employer   |
        | R01/Current Academic Year | Aug/Current Academic Year | 900                    | 100                         | Learning         | employer 1 |
        | R02/Current Academic Year | Sep/Current Academic Year | 900                    | 100                         | Learning         | employer 1 |
        | R03/Current Academic Year | Oct/Current Academic Year | 900                    | 100                         | Learning         | employer 1 |
    But the Provider now changes the Learner details as follows
		| Start Date                   | Planned Duration | Residual Training Price | Residual Training Price Effective Date | Residual Assessment Price | Residual Assessment Price Effective Date | Actual Duration | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Framework Code | Pathway Code | Programme Type | Funding Line Type                                                     | SFA Contribution Percentage |
		| 04/Aug/Current Academic Year | 12 months        | 5000                    | 10/Nov/Current Academic Year           | 625                       | 10/Nov/Current Academic Year             |                 | continuing        | Act2          | 1                   | ZPROG001      | 403            | 1            | 25             | 16-18 Apprenticeship (From May 2017) Non-Levy Contract (non-procured) | 90%                         |
	And the employment status in the ILR is:
        | Employer   | Employment Status  | Employment Status Applies    | Small Employer |
        | employer 2 | in paid employment | 10/Nov/Current Academic Year |                |

	When the amended ILR file is re-submitted for the learners in collection period <Collection_Period>
	Then the following learner earnings should be generated
		| Delivery Period           | On-Programme | Completion | Balancing | 
        | Aug/Current Academic Year | 1000         | 0          | 0         |
        | Sep/Current Academic Year | 1000         | 0          | 0         |
        | Oct/Current Academic Year | 1000         | 0          | 0         |
        | Nov/Current Academic Year | 500          | 0          | 0         |
        | Dec/Current Academic Year | 500          | 0          | 0         |
        | Jan/Current Academic Year | 500          | 0          | 0         |
        | Feb/Current Academic Year | 500          | 0          | 0         |
        | Mar/Current Academic Year | 500          | 0          | 0         |
        | Apr/Current Academic Year | 500          | 0          | 0         |
        | May/Current Academic Year | 500          | 0          | 0         |
        | Jun/Current Academic Year | 500          | 0          | 0         |
        | Jul/Current Academic Year | 500          | 0          | 0         |
    And only the following payments will be calculated
		| Collection Period         | Delivery Period           | On-Programme | Completion | Balancing | Employer   |
		| R04/Current Academic Year | Nov/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R05/Current Academic Year | Dec/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R06/Current Academic Year | Jan/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R07/Current Academic Year | Feb/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R08/Current Academic Year | Mar/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R09/Current Academic Year | Apr/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R10/Current Academic Year | May/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R11/Current Academic Year | Jun/Current Academic Year | 500          | 0          | 0         | employer 2 |
        | R12/Current Academic Year | Jul/Current Academic Year | 500          | 0          | 0         | employer 2 |
	And only the following provider payments will be recorded
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Employer   |
        | R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
	And at month end only the following provider payments will be generated
		| Collection Period         | Delivery Period           | SFA Co-Funded Payments | Employer Co-Funded Payments | Transaction Type | Employer   |
        | R04/Current Academic Year | Nov/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R05/Current Academic Year | Dec/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R06/Current Academic Year | Jan/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R07/Current Academic Year | Feb/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R08/Current Academic Year | Mar/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R09/Current Academic Year | Apr/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R10/Current Academic Year | May/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R11/Current Academic Year | Jun/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
        | R12/Current Academic Year | Jul/Current Academic Year | 450                    | 50                          | Learning         | employer 2 |
Examples:
        | Collection_Period         |
        | R04/Current Academic Year |
        | R05/Current Academic Year |
        | R06/Current Academic Year |
        | R07/Current Academic Year |
        | R08/Current Academic Year |
        | R09/Current Academic Year |
        | R10/Current Academic Year |
        | R11/Current Academic Year |
        | R12/Current Academic Year |