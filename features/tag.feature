Feature: Tags feature
  
Background:
  Given The first video has the first tag
  Given User "test@techbay.com":"12345678" has no subscribed tags
  
Scenario: Show tags without subscription links if not logged in
  When I am on the homepage
  Then I should see tag links
  And I should not see subscribe_tag links

Scenario: Show tags with subscription links if logged in
  When I am on the homepage
  And User "test@techbay.com":"12345678" has logged in
  Then I should see tag links
  And I should see subscribe_tag links
  When I click the first "+" link
  And I should see success alert for "subscribe" 
  # check this first to let controller finishes first before checking the dabase 
  # in the following line
  And I should have "1" tags
  When I click the first "-" link
  And I should see success alert for "unsubscribe"
  And I should have "0" tags