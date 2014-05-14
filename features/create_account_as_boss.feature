Feature: employees should be able to log hours

  As an employee
  So that I can get paid
  I want to report work hours


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | true            |
  
  Scenario: navigate to timecard form
    Given I am on the employee homepage
    And I follow "Fill Out New Timecard"
    Then I should be on the new timecard page
    And I should see "Hours Worked:"
    And I should see "Work Date:"
    And I should see "Submit Timecard"
    And I should see "Type of Work Hours:"


