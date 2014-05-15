Feature: log hours boss

  As a boss
  So that I can manage payroll
  I want to report work hours


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | false           |
  
  Scenario: navigate to timecard form
    Given I am an employee with boss privileges
    And I am on the employee homepage
    And I follow "Fill Out New Timecard"
    Then I should be on the new timecard page
    And I should see "Hours Worked:"
    And I should see "Work Date:"
    And I should see "Submit Timecard"
    And I should see "Type of Work Hours:"

  Scenario: submit a valid timecard form
    Given I am an employee with boss privileges
    And I am on the new timecard page
    And I fill in "timecard_hours_worked" with "8"
    And I choose "timecard_paycode_normal" 
    And I select "2014" from "timecard_date_1i"
    And I select "May" from "timecard_date_2i"
    And I select "20" from "timecard_date_3i"
    And I press "Submit Timecard"
    Then I should be on the employee homepage

  Scenario: submit a timecard form with too many hours
    Given I am an employee with boss privileges
    And I am on the new timecard page
    And I fill in "timecard_hours_worked" with "25"
    And I choose "timecard_paycode_normal" 
    And I select "2014" from "timecard_date_1i"
    And I select "May" from "timecard_date_2i"
    And I select "20" from "timecard_date_3i"
    And I press "Submit Timecard"
    Then I should be on the new timecard page

  Scenario: submit a timecard form from too long ago
    Given I am an employee with boss privileges
    And I am on the new timecard page
    And I fill in "timecard_hours_worked" with "25"
    And I choose "timecard_paycode_normal" 
    And I select "2012" from "timecard_date_1i"
    And I select "May" from "timecard_date_2i"
    And I select "20" from "timecard_date_3i"
    And I press "Submit Timecard"
    Then I should be on the new timecard page
