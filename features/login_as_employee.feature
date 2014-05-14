Feature: employee log in

  As an employee
  So that I can submit submit reports
  I want to log in


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | 
      | empl@gmail.com | emplpass           | Lucas     |
      | boss@gmail.com | bosspass           | Scott     |
  
  Scenario: access the log in module
    Given I am on the homepage
    Then I should see "Login"
    And I follow "Login"
    Then I should see "Email:" 
    And I should see "Password:"
    And I should see "Login"

  Scenario: provide correct credentials and submit
    Given I am on the login page
    And I fill in "user_email" with "empl@gmail.com"
    And I fill in "user_encrypted_password" with "emplpass"
    And I press "Login"
    Then I should be on the employee homepage

    
