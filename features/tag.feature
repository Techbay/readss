Feature: Tags feature
  
Background:
  Given The first video is has the first tag
  
Scenario: Show tags without subscription links if not logged in
  When I am on the homepage
  Then I should see tag links
  And I should not see subscribe_tag links