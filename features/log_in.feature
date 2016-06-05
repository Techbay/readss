Feature: Log In
Scenario: Successful log in
  When User "test@techbay.com":"12345678" has logged in
  Then I should see "Log Out"
  And I should see "test@techbay.com"
Scenario: Unsuccessful log in
  When User "test@techbay.com":"12345678" has not logged in
  Then I should not see "Log Out"
  And I should not see "test@techbay.com"