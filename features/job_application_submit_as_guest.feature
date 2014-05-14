Feature: submit application

  As a guest
  So that I can get a job
  I want to submit my application

Background: user is a guest

  Given I am a guest

Scenario: submitting a valid application (happy path)
  Given I am on the job application page
  And I fill in "Name" with "John Doe"
  And I fill in "Phone" with "1234567890"
  And I fill in "Email" with "john.doe@fakemail.com"
  And I check "Crime"
  And I check "Drive"
  And I press "Submit"
  Then I should be on the job application page
  And I should see "Application submitted successfully!"

Scenario: submitting an application without a name (sad path)
  Given I am on the job application page
  And I fill in "Name" with ""
  Then I should be on the job application page
  And I should see "Please fill out all required fields:"

Scenario: submitting an application without a phone (sad path)
  Given I am on the job application page
  And I fill in "Phone" with ""
  Then I should be on the job application page
  And I should see "Please fill out all required fields:"

Scenario: submitting an application without an E-Mail (sad path)
  Given I am on the job application page
  And I fill in "Email" with ""
  Then I should be on the job application page
  And I should see "Please fill out all required fields:"
