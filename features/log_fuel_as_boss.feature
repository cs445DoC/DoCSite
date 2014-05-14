Feature: log fuel boss

  As a boss
  So that I can manage fuel reports
  I want to track fuel consumed

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


  Scenario: submit fuel usage report page as a boss
    Given I am an employee with boss privileges
    And I am on the new fuel usage report page
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "14" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "LIK34B0SS"
    And I fill in "fuel_usage_mileage" with "100"
    And I fill in "fuel_usage_gallons" with "10"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page
