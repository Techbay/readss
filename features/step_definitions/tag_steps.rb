Given(/^The first video has the first tag$/) do
  Video.first.tags << Tag.first
end

Given(/^User "([^"]*)":"([^"]*)" has no subscribed tags$/) do |email, password|
  User.find_by_email(email).tags.delete(Tag.all)
end


Then(/^I should( not)? see ([^"]*) links$/) do |bool, link|
  # link is the html class
  expected = !bool
  
  # page.find will *try* to wait until ajax finishes. Capybara seems to be smart enough.
  begin
    page.find("."+link)
  rescue 
  end
    
  actual = page.all('.'+link).any?
  msg = 'I should#{bool} see #{link} links'
  assert_equal expected, actual, msg
end


Then(/^I should have "([^"]*)" tags$/) do |n|
  expected = n.to_i
  actual = @current_user.tags.count
  msg = 'I should have #{n} tags'
  assert_equal expected, actual, msg
end