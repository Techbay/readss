Feature: Video playback

Background: 
  # Make sure these conditions are met
  Given The first video is set to pro
  And User "test@techbay.com" has "8" reward
  And User "test@techbay.com" has not redeemed any videos
  
Scenario: No embedded video when first landing
  When I am on the homepage
  Then I should not see an embedded video
  
Scenario: Show regular videos without login
  When I am on the homepage
  And I click the first "Show" link
  Then I should see an embedded video
  
Scenario: Redeem video after login (User cancel)
  When User "test@techbay.com":"12345678" has logged in
  And I click the first "Redeem" link
  And I click "Cancel" button
  
Scenario: Redeem video after login (User confirm)
  When User "test@techbay.com":"12345678" has logged in
  And I click the first "Redeem" link
  And I input redeem verification
  And I click "Confirm" button
  Then I should see success alert for "video"