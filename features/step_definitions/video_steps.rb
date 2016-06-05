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


