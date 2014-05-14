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
    Given I am on the login page
    And I fill in "user_email" with "boss@gmail.com"
    And I fill in "user_encrypted_password" with "bosspass"
    And I press "Login"
    Then I should be on the employee homepage
    And I follow "Fuel Usage Report"
    And I press "Generate Report"

  Scenario: access the fuel usage report page as an employee (sad path)
    Given I am on the login page
    And I fill in "user_email" with "empl@gmail.com"
    And I fill in "user_encrypted_password" with "emplpass"
    And I press "Login"
    Then I should be on the employee homepage
    And I follow "Fuel Usage Report"
    And I should see "Employees Cannot Access Reports"

  Scenario: submit fuel usage report page as a boss
    Given I am on the login page
    And I fill in "user_email" with "boss@gmail.com"
    And I fill in "user_encrypted_password" with "bosspass"
    And I press "Login"
    Then I should be on the employee homepage
    And I follow "Fuel Usage Report"
    And I press "File Report"
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "14" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "LIK34B0SS"
    And I fill in "fuel_usage_mileage" with "100"
    And I fill in "fuel_usage_gallons" with "10"
    And I press "Submit Fuel Worksheet Entry"
    And I should see "Report Saved"

  Scenario: submit fuel usage report page as an employee
    Given I am on the login page
    And I fill in "user_email" with "empl@gmail.com"
    And I fill in "user_encrypted_password" with "emplpass"
    And I press "Login"
    Then I should be on the employee homepage
    And I follow "Fuel Usage Report"
    And I press "File Report"
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "14" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "M1N10N"
    And I fill in "fuel_usage_mileage" with "100"
    And I fill in "fuel_usage_gallons" with "10"
    And I press "Submit Fuel Worksheet Entry"
    And I should see "Report Saved"
