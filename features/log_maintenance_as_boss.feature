Feature: log maintenance report
  As a boss
  So that I can manage vehicle maintenance
  I want to log vehicle maintenance


  Background: employees in database
    
    Given the following employees exist:
      | email          | encrypted_password | last_name | boss_privileges |
      | empl@gmail.com | emplpass           | Lucas     | false           |
      | boss@gmail.com | bosspass           | Lucas     | true            |
  
  Scenario: navigate to vehicle maintenance form
    Given I am an employee with boss privileges
    And I follow "Create New Vehicle Maintenance Report"
    Then I should be on the vehicle maintenance report page
    And I should see "File a New Maintenance Report"
    And I should see "Date of Service:"
    And I should see "License Plate of Serviced Vehicle:"
    And I should see "Work Description:"

  Scenario: create a valid maintenance record
    Given I am an employee with boss privileges
    And I am on the vehicle maintenance report page
    And I select "2014" from "maintenance_record_date_1i" 
    And I select "May" from "maintenance_record_date_2i" 
    And I select "20" from "maintenance_record_date_3i" 
    And I fill in "maintenance_record_license_plate" with "455207"
    And I fill in "maintenance_record_work_description" with "We did a lot of work. It was hard."
    And I press "Submit Maintenance Report"
    Then I should be on the employee homepage

  Scenario: create a maintenance record with from too long ago
    Given I am an employee with boss privileges
    And I am on the vehicle maintenance report page
    And I select "2012" from "maintenance_record_date_1i" 
    And I select "May" from "maintenance_record_date_2i" 
    And I select "20" from "maintenance_record_date_3i" 
    And I fill in "maintenance_record_license_plate" with "455207"
    And I fill in "maintenance_record_work_description" with "We did a lot of work. It was hard."
    And I press "Submit Maintenance Report"
    Then I should be on the maintenance report page

  Scenario: create a maintenance record with no license plate
    Given I am an employee with boss privileges
    And I am on the vehicle maintenance report page
    And I select "2012" from "maintenance_record_date_1i" 
    And I select "May" from "maintenance_record_date_2i" 
    And I select "20" from "maintenance_record_date_3i" 
    And I fill in "maintenance_record_work_description" with "We did a lot of work. It was hard."
    And I press "Submit Maintenance Report"
    Then I should be on the maintenance report page

  Scenario: create a maintenance record with fno work description
    Given I am an employee with boss privileges
    And I am on the vehicle maintenance report page
    And I select "2012" from "maintenance_record_date_1i" 
    And I select "May" from "maintenance_record_date_2i" 
    And I select "20" from "maintenance_record_date_3i" 
    And I fill in "maintenance_record_license_plate" with "455207"
    And I press "Submit Maintenance Report"
    Then I should be on the maintenance report page

