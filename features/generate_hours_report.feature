Feature: hours report generation

  As a boss
  So that I can manage payroll
  I want to generate hours reports

  Background: hours in database

      Given the following fuel usages exist:
        | date       | weekending | hours_worked  | paycode |
        | 03/26/1990 | true       | 21            | ABC     |
        | 03/27/1990 | false      | 19            | 123     |
        | 03/26/1990 | false      | 12            | DOR     |
        | 03/28/1990 | true       | 10            | EME     |

  Scenario: access the hours report page as a boss
    Given I am an employee with boss privileges
    And I follow "Hours Report"
    And I press "Generate Report"
    Then I should see "Requested Fuel Report"

  Scenario: access the hours report page as an employee
    Given I am an employee without boss privileges
    And I follow "Hours Report"
    And I press "Generate Report"
    Then I should see "Requested Fuel Report"

  Scenario: access the hours report page as a guest
    Given I am a guest
    And I follow "Hours Report"
    And I press "Generate Report"
    Then I should see "Requested Fuel Report"

