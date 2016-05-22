require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  fixtures :all
  # test "the truth" do
  #   assert true
  # end`
  test "log in and redeem" do
    get root_path
    assert_response :success
    assert_select "title", "VideoBay"
    assert_select 'a', I18n.t('.layouts.header.log_in', default: 'Log In')
    
    # log in
    get new_user_session_path
    assert_response :success
    assert_select "form input:match('class', ?)", "form-control", {count: 2} 
    # using fixtures doesn't seem to work even with fixtures :all 
    #user = users(:test_user)
    #post user_session_path, params: { user: {email: user[:email], password: user[:password]}}
    post user_session_path, params:{user: {email: "test@techbay.com", password: '12345678'}}
    follow_redirect!
    
    #should get list of videos
    assert_response :success
    assert_equal '/', path
    assert_select 'h1', 'All Videos'
    assert_select "a:match('id', ?)", /show_\d+/, {count: Video.where(:is_pro => false).count}
    assert_select "a:match('id', ?)", /redeem_\d+/, {count: Video.where(:is_pro => true).count}
    
    # show video test
    
    # redeem video test
    
  end
end
