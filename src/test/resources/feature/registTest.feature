Feature: movie select 
       open movie index  
  
  Scenario: select user   
    Given Go to user select  
    When  I find movie  
    And   select the userID "1"
    And   Click the submit  
    Then  goto the index