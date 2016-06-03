# features/home_page.feature
Feature: Home page


Scenario: Not on VideoBay's home page
  When I am not on the homepage
  Then I should not see the title as "All Videos"
Scenario: Viewing VideoBay's home page
    When I am on the homepage
    Then I should see the title as "All Videos"