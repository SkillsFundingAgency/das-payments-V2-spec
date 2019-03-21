#Scenario: DLOCK09 - When no matching record found in an employer digital account for the start date then datalock DLOCK_09 will be produced
#    
#	Given the following commitments exist:
#        | commitment Id | version Id | Provider   | ULN       | standard code | agreed price | start date | end date   | status | effective from |
#        | 73            | 73-125     | Provider a | learner a | 23            | 10000        | 01/06/2018 | 01/05/2019 | active | 01/06/2018     |
#        
#    When an ILR file is submitted with the following data:  
#        | Provider   | ULN       | standard code | start date | planned end date | completion status | Total training price | Total training price effective date | Total assessment price | Total assessment price effective date |
#        | Provider a | learner a | 23            | 01/05/2018 | 08/08/2019       | continuing        | 9000                 | 01/05/2018                          | 1000                   | 01/05/2018                            |
#    
#    Then the following data lock event is returned:
#        | Price Episode identifier  | Apprenticeship Id | ULN       | ILR Start Date | ILR Training Price | ILR End point assessment price  | 
#        | 25-23-01/05/2018          | 73                | learner a | 01/05/2018     | 9000               | 1000                            |
#    And the data lock event has the following errors:    
#        | Price Episode identifier  | Error code | Error Description										                                                             |
#        | 25-23-01/05/2018          | DLOCK_09   | The start date for this negotiated price is before the corresponding price start date in the employer digital account |
#    And the data lock event has the following periods    
#        | Price Episode identifier | Period   | Payable Flag | Transaction Type |
#        | 25-23-01/05/2018         | 1718-R11 | false        | Learning         |
#        | 25-23-01/05/2018         | 1718-R12 | false        | Learning         |
#    And the data lock event used the following commitments   
#        | Price Episode identifier | Apprentice Version | Start Date | standard code | Negotiated Price | Effective Date |
#        | 25-23-01/05/2018         | 73-125             | 01/06/2018 | 23            | 10000            | 01/06/2018     |		Feature:Datalocks

		Feature:Datalocks
		I want to be notified with a DLOCK09 when no matching record found in an employer digital account for the start date
        So that I can correct the data mis-match between the Commitment and ILR PV2-668

		Scenario Outline: DLOCK09 - When no matching record found in an employer digital account for the start date then datalock DLOCK_09 will be produced

			Given the following commitments exist		 
			| commitment Id | version Id | Learner ID | framework code | programme type | pathway code | agreed price | start date                 | end date                     | status | effective from             |
			| 73            | 73-125     | learner a  | 593            | 20             | 1            | 10000        | 01/June/Last Academic Year | 01/May/Current Academic Year | active | 01/June/Last Academic Year |
				
			And the provider is providing training for the following learners
			| Learner ID | Start Date                | Planned Duration | Total Training Price | Total Training Price Effective Date | Completion Status | Contract Type | Aim Sequence Number | Aim Reference | Standard code | Programme type | Funding Line Type                                  | SFA Contribution Percentage |
			| learner a  | 01/May/Last Academic Year | 15 months        | 10000                | 01/May/Last Academic Year           | continuing        | Act1          | 1                   | ZPROG001      | 23            | 25             | 16-18 Apprenticeship (From May 2017) Levy Contract | 90%                         |

			
			When the ILR file is submitted for the learners for collection period <Collection_Period>

			Then the following data lock event is returned
				 | Price Episode identifier        | Apprenticeship Id | Learner ID | ILR Start Date            | ILR Training Price |
				 | 25-23-01/May/Last Academic Year | 73                | learner a  | 01/May/Last Academic Year | 10000              |
			# New steps /lines for datalocks	  
			 And the data lock event has the following errors:    
			      | Price Episode identifier        | Error code | Error Description                                                                                                     |
			      | 25-23-01/May/Last Academic Year | DLOCK_09   | The start date for this negotiated price is before the corresponding price start date in the employer digital account |
			  
			 And the data lock event has the following periods:  
			      | Price Episode identifier        | Period   | Payable Flag | Transaction Type |
			      | 25-23-01/May/Last Academic Year | 1718-R10 | false        | Learning         |
			      | 25-23-01/May/Last Academic Year | 1718-R11 | false        | Learning         |
			      | 25-23-01/May/Last Academic Year | 1718-R12 | false        | Learning         |
			  
			 And the data lock event used the following commitments:
			      | Price Episode identifier        | Apprentice Version | Start Date                | Standard code | Programme type | Negotiated Price | Effective Date            |
			      | 25-23-01/May/Last Academic Year | 73-125             | 01/May/Last Academic Year | 23            | 20             | 10000            | 01/May/Last Academic Year |

	   		 And the following learner earnings should be generated
				| Delivery Period           | On-Programme | Completion | Balancing |
				| May/Last Academic Year    | 0            | 0          | 0         |
				| Jun/Last Academic Year    | 0            | 0          | 0         |
				| Jul/Last Academic Year    | 0            | 0          | 0         |
				| Aug/Current Academic Year | 0            | 0          | 0         |
				| Sep/Current Academic Year | 0            | 0          | 0         |
				| Oct/Current Academic Year | 0            | 0          | 0         |
				| Nov/Current Academic Year | 0            | 0          | 0         |
				| Dec/Current Academic Year | 0            | 0          | 0         |
				| Jan/Current Academic Year | 0            | 0          | 0         |
				| Feb/Current Academic Year | 0            | 0          | 0         |
				| Mar/Current Academic Year | 0            | 0          | 0         |
				| Apr/Current Academic Year | 0            | 0          | 0         |
				| May/Current Academic Year | 0            | 0          | 0         |
				| Jun/Current Academic Year | 0            | 0          | 0         |
				| Jul/Current Academic Year | 0            | 0          | 0         |
				

			And at month end no payments will be calculated

			And no provider payments will be recorded

			And no provider payments will be generated

		  Examples:
				| Collection_Period      | 
				| R10/Last Academic Year |
				| R11/Last Academic Year |
				| R12/Last Academic Year |
