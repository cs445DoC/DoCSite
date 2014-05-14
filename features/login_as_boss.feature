Feature: boss log in

  As a boss
  So that I can generate reports
  I want to log in


  Background: bosses in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | false           |
      | boss@gmail.com | bosspass           | Scott     | true            |
  
  Scenario: access the log in module
    Given I am on the homepage
    Then I should see "Login"
    And I follow "Login"
    Then I should see "Email:" 
    And I should see "Password:"
    And I should see "Login"

  Scenario: provide correct credentials and submit
    Given I am on the login page
    And I fill in "user_email" with "boss@gmail.com"
    And I fill in "user_encrypted_password" with "bosspass"
    And I press "Login"
    Then I should be on the employee homepage
    And I should see "Create New Employee"

    
