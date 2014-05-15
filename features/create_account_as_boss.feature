Feature: account creation
  As a boss
  So that I can have employees use employee features
  I want to create new accounts


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | false           |
      | boss@gmail.com | bosspass           | Lucas     | true            |
  
  Scenario: navigate to employee creation form form
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I should see "Create Account for New Employee"
    And I should see "First name:"
    And I should see "Last name:"
    And I should see "Email address:"
    And I should see "New user password:"


  Scenario: create a valid new employee
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I fill in "user_first_name" with "Bobgoodname"
    And I fill in "user_last_name" with "Howardlastness"
    And I fill in "user_email" with "bobsemail@gmail.com"
    And I fill in "user_encrypted_password" with "bobspassword"
    And I press "Create Employee Account"
    Then I should be on the employee homepage

  Scenario: create a valid new employee with no first name
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I fill in "user_last_name" with "Howardlastness"
    And I fill in "user_email" with "bobsemail@gmail.com"
    And I fill in "user_encrypted_password" with "bobspassword"
    And I press "Create Employee Account"
    Then I should be on the employee homepage

  Scenario: create a new employee with no last name
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I fill in "user_first_name" with "Bobgoodname"
    And I fill in "user_email" with "bobsemail@gmail.com"
    And I fill in "user_encrypted_password" with "bobspassword"
    And I press "Create Employee Account"
    Then I should be on the employee account creation page


  Scenario: create a new employee with no email
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I fill in "user_first_name" with "Bobgoodname"
    And I fill in "user_last_name" with "Howardlastness"
    And I fill in "user_encrypted_password" with "bobspassword"
    And I press "Create Employee Account"
    Then I should be on the employee account creation page

  Scenario: create a new employee with no password
    Given I am an employee with boss privileges
    And I follow "Create New Employee"
    Then I should be on the employee account creation page
    And I fill in "user_first_name" with "Bobgoodname"
    And I fill in "user_last_name" with "Howardlastness"
    And I fill in "user_email" with "bobsemail@gmail.com"
    And I press "Create Employee Account"
    Then I should be on the employee account creation page
