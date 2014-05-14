Feature: guest should be able to see contact form

  As a guest
  So that I can contact organization
  I want to view contact page

Background: user is a guest

  Given the user is a guest

Scenario: viewing the contact page
  Given I am on the contact page
  Then  I should see "You can contact Drake of Conklin via this form:"
