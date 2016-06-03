Feature: Sign up
Scenario: Successful sign up
  When I sign up with "abc@gmail.com":"abcdefg"
  Then I should see "rewards"
  And I should see "abc@gmail.com"