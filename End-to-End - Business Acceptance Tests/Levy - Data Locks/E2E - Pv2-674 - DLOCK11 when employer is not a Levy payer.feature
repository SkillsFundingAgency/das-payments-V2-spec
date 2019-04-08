Scenario: DLOCK11 - When employer is not a levy payer, DLOCK11 will be raised

    Given the employer is not a levy payer
    And the following commitments exist:
        | commitment Id | version Id | Provider   | ULN       | framework code | programme type | pathway code | agreed price | start date | end date   | status | effective from |
        | 73            | 73-125     | Provider a | learner a | 450            | 2              | 1            | 10000        | 01/05/2018 | 01/05/2019 | active | 01/05/2018     |
        
    When an ILR file is submitted with the following data:  
        | Provider   | ULN       | framework code | programme type | pathway code | start date | planned end date | completion status | Total training price | Total training price effective date |
        | Provider a | learner a | 450            | 2              | 1            | 01/05/2018 | 08/08/2019       | continuing        | 10000                | 01/05/2018                          |
    
    Then the following data lock event is returned:
        | Price Episode identifier  | Apprenticeship Id | ULN       | ILR Start Date | ILR Training Price | 
        | 2-450-1-01/05/2018        | 73                | learner a | 01/05/2018     | 10000              |
    And the data lock event has the following errors:    
        | Price Episode identifier | Error code | Error Description                          |
        | 2-450-1-01/05/2018       | DLOCK_11   | The employer is not currently a levy payer |
    And the data lock event has the following periods    
        | Price Episode identifier | Period   | Payable Flag | Transaction Type |
        | 2-450-1-01/05/2018       | 1718-R10 | false        | Learning         |
        | 2-450-1-01/05/2018       | 1718-R11 | false        | Learning         |
        | 2-450-1-01/05/2018       | 1718-R12 | false        | Learning         |
    And the data lock event used the following commitments   
        | Price Episode identifier | Apprentice Version | Start Date | framework code | programme type | pathway code | Negotiated Price | Effective Date |
        | 2-450-1-01/05/2018       | 73-125             | 01/05/2018 | 450            | 2              | 1            | 10000            | 01/05/2018     |