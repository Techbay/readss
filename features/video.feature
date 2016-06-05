Feature: Video playback
 
Scenario: No embedded video when first landing
  When I am on the homepage
  Then I should not see an embedded video
  
Scenario: Show regular videos without login
  When I am on the homepage
  And I click the first "Show" link
  Then I should see an embedded video
  
Scenario: Redeem video after login
  When User "test@techbay.com":"12345678" has logged in
  And I click the first "Redeem" link
  And I click "Cancel" button
  And I should not see an embedded video
