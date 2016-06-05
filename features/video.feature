Feature: Video playback
 
Scenario: No embedded video when first landing
  When I am on the homepage
  Then I should not see an embedded video
  
Scenario: Show regular videos without login
  When I am on the homepage
  And I clicked "Show"
  Then I should see an embedded video