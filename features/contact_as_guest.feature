Feature: guest should be able to use contact form

  As a guest
  So that I can contact the Drake of Conklin bosses
  I want to use the contact form

Background: user is a guest

  Given the user is a guest

Scenario: viewing the contact page
  Given I am on the contact page
  Then  I should see "You can contact Drake of Conklin via this form:"
