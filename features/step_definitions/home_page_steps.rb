When(/^I am( not)? on the homepage$/) do |bool|
  if bool
    visit new_user_session_path
  else
    visit root_path
  end
end

Then(/^I should( not)? see the title as "([^"]*)"$/) do |bool, title|
  # Write code here that turns the phrase above into concrete actions
  expected = !bool
  #actual = page.has_content?(title)
  actual = (page.all("h1.text-center", text: title).size == 1)
  msg = 'I should#{bool} see the title as "#{title}"'
  assert actual == expected, msg
end