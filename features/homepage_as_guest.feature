Feature: guest should be able to see homepage

  As a guest
  So that I can use the Drake of Conklin site
  I want to view the homepage

Background: user is a guest

  Given the user is a guest

Scenario: viewing the homepage
  Given I am on the homepage
  Then  I should see "Welcome to Drake of Conklin!"
