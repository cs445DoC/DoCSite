Feature: guest should be able to use job application form

  As a guest
  So that I can aquire a job at Drake of Conklin
  I want to use the job application form

Background: user is a guest

  Given the user is a guest

Scenario: viewing the job application page
  Given I am on the job application page
  Then  I should see "You can send a job application to Drake of Conklin via this form:"
