When(/^I am on the homepage$/) do
  visit root_path # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the title as "([^"]*)"$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
  assert page.has_content?(arg1)
  # assert page.has_css?('a.navbar-brand.' + arg1)
end