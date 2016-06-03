When(/^Click "([^"]*)"$/) do |link|
  # Write code here that turns the phrase above into concrete actions
  click_link(link)
end

Then(/^I should see a form$/) do
  # Write code here that turns the phrase above into concrete actions
  assert page.has_content?("All Videos")
end