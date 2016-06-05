When(/^I clicked "([^"]*)"$/) do |link|
  click_link(link, match: :first)
  start = Time.now
  while page.driver.network_traffic.collect(&:response_parts).any?(&:empty?)
    raise "Timed out waiting for poltergeist traffic to finish up #{page.driver.network_traffic}" if Time.now - start > 10
    sleep 0.1
  end
end

Then(/^I should( not)? see an embedded video$/) do |bool|
  expected = !bool
  actual = page.all(".embed-video").any?
  msg = 'I should#{bool} see an embedded video'
  assert_equal expected, actual, msg
end


def wait_for_ajax
  counter = 0
  while page.evaluate_script("return $.active").to_i > 0
    counter += 1
    sleep(0.1)
    raise "AJAX request took longer than 5 seconds." if counter >= 50
  end
end