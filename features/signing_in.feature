Feature: Signing in

Scenario: Unsuccessful signin
  Given I am on the signin page
  When I press "Sign in" 
  Then I should see "Invalid email or password."

Scenario: Successful signin
  Given I am on the signin page
  And I have user "ken@ken.com" with password "password"
  When I fill in "Email" with "ken@ken.com"
  And I fill in "Password" with "password"
  And I press "Sign in" 
  Then I should see "Signed in successfully."
