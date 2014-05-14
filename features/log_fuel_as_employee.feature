Feature: log fuel

  As an employee
  So that I can validate my fuel usage
  I want to report fuel consumption


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | false           |
      | boss@gmail.com | bosspass           | Scott     | true            |
  
  Scenario: navigate to the fuel report page
    Given I am on the employee homepage
    And I follow "New Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page

  Scenario: submit a valid fuel usage report
    Given I am on the new fuel usage report page
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "20" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "drake123"
    And I fill in "Mileage" with "230"
    And I fill in "Gallons" with "20"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the employee homepage

  Scenario: submit a fuel usage report from too long ago
    Given I am on the new fuel usage report page
    And I select "2012" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "20" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "drake123"
    And I fill in "Mileage" with "230"
    And I fill in "Gallons" with "20"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page
    
  Scenario: submit a fuel usage report with no miles
    Given I am on the new fuel usage report page
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "20" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "drake123"
    And I fill in "Mileage" with "0"
    And I fill in "Gallons" with "20"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page

  Scenario: submit a fuel usage report with no gallons
    Given I am on the new fuel usage report page
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "20" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "drake123"
    And I fill in "Mileage" with "20"
    And I fill in "Gallons" with "0"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page

  Scenario: submit fuel usage report page as an employee
    Given I am an employee without boss privileges
    And I am on the new fuel usage report page
    And I select "2014" from "fuel_usage_date_1i"
    And I select "May" from "fuel_usage_date_2i"
    And I select "14" from "fuel_usage_date_3i"
    And I fill in "fuel_usage_license_plate" with "M1N10N"
    And I fill in "fuel_usage_mileage" with "100"
    And I fill in "fuel_usage_gallons" with "10"
    And I press "Submit Fuel Worksheet Entry"
    Then I should be on the new fuel usage report page
