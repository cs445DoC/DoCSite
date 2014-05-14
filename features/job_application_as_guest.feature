Feature: application page

  As a guest
  So that I can submit application
  I want to view applications page

Background: user is a guest

  Given I am a guest

Scenario: viewing the job application page
  Given I am on the job application page
  Then  I should see "You can send a job application to Drake of Conklin via this form:"
