When(/^User "([^"]*)":"([^"]*)" has( not)? logged in$/) do |email, password, bool|
  to_sign_in = !bool
  if to_sign_in
    sign_in_user(email, password)# Write code here that turns the phrase above into concrete actions
  else
    sign_in_user(email, password*2)
  end
  @current_user = User.find_by_email(email)
end

Then(/^I should( not)? see "([^"]*)"$/) do |bool, str|
  expected = !bool
  actual = page.has_content?(str)
  msg = 'I should#{bool} see #{str}#'
  assert_equal expected, actual, msg
end


def sign_in_user(email, password)
  visit root_path
  click_link("Log In")
  fill_in("inputEmail", with: email)
  fill_in("inputPassword", with: password)
  click_button("Sign in")
end