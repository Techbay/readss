Given(/^The first video is has the first tag$/) do
  Video.first.tags << Tag.first
end

Then(/^I should( not)? see ([^"]*) links$/) do |bool, link|
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