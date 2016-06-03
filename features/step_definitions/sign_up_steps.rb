When(/^I sign up with "([^"]*)":"([^"]*)"$/) do |email, password|
    sign_up_user(email, password)
end

def sign_up_user(email, password)
  visit root_path
  click_link('Log In')
  click_link('Sign up')
  fill_in("user_email", with: email)
  fill_in("user_password", with: password)
  fill_in("user_password_confirmation", with: password)
  click_button('Sign up')
end