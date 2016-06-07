Given(/^The first video is set to pro$/) do
  Video.first.update(:is_pro => true)
end

Given(/^User "([^"]*)" has "([^"]*)" reward$/) do |email, n|
  User.find_by_email(email).update(reward: n.to_i)
end

Given(/^User "([^"]*)" has( not) redeemed any videos$/) do |email, bool|
  User.find_by_email(email).videos.delete(Video.all)
end

When(/^I click the first "([^"]*)" link$/) do |link|
  click_link(link, match: :first)
end

When(/^I click "([^"]*)" button$/) do |button|
  click_button(button, match: :first)
end


Then(/^I should( not)? see an embedded video$/) do |bool|
  expected = !bool
  
  # page.find will *try* to wait until ajax finishes. Capybara seems to be smart enough.
  begin
    page.find(".embed-video")
  rescue 
  end
    
  actual = page.all(".embed-video").any?
  msg = 'I should#{bool} see an embedded video'
  assert_equal expected, actual, msg
end

When(/^I input "([^"]*)"$/) do |s|
  page.find(".form-control").set(s)
end

When(/^I input redeem verification$/) do
  page.find(".form-control").set(@current_user.reward - 1)
end


Then(/^I should( not)? see success alert for "([^"]*)"$/) do |bool, text|
  begin
    page.find(".alert.alert-success", :text => text)
  rescue
  end
  
  expected = !bool
  actual = page.all(".alert.alert-success", :text => text).count == 1
  msg = 'I should#{bool} see success alert'
  assert_equal expected, actual, msg
end


