Feature: homepage

  As a guest
  So that I can view organization info
  I want to view homepage

Background: user is a guest

  Given the user is a guest

Scenario: viewing the homepage
  Given I am on the homepage
  Then  I should see "Welcome to Drake of Conklin!"
