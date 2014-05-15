Feature: fuel report generation

  As a boss
  So that I can validate fuel usage
  I want to generate fuel reports

  Background: fuel_usages in database

      Given the following fuel usages exist:
        | date       | gallons | license_plate | mileage |
        | 03/26/1990 | 1.54    | FL4V0R        | 45      |
        | 03/27/1990 | 10.46   | FL4V          | 105     |
        | 03/26/1990 | 13.4    | Y34H          | 73      |
        | 03/28/1990 | 78.9    | B0YY          | 17      |

      Given the following employees exist:
        | email          | encrypted_password | last_name | boss_privileges |
        | empl@gmail.com | emplpass           | Lucas     | false           |
        | boss@gmail.com | bosspass           | Scott     | true            |

  Scenario: access the fuel usage report page as a boss
    Given I am an employee with boss privileges
    And I am on the employee homepage
    And I follow "Generate Reports"
    And I follow "Fuel Usage Report"
    And I press "Generate Report"
    Then I should see "Requested Fuel Report"

  Scenario: access the fuel usage report page as an employee (sad path)
    Given I am an employee without boss privileges
    And I am on the employee homepage
    Then I should not see "Generate Reports"
    

  Scenario: access the fuel usage report page as a guest (sad path)
    Given I am a guest
    Then I should not see "Generate Reports"

