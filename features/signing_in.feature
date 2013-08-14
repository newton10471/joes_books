Feature: Signing in

Scenario: Unsuccessful signin
  Given a user visits the signin page
  When he submits invalid signin information
  Then he should see an error message
