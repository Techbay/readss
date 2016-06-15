require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
    setup do
      user = {email: users(:test_user).email, password: "12345678"}
      sign_in(user)
    end
    
    test "should increase tags count" do
      #subscription
      assert_difference('users(:test_user).tags.count', 1) do
        post tag_subscribe_path(params: {id: tags(:one).id}) 
        users(:test_user).reload
      end
      #unsubscription is the same path with a existing tag as input
      assert_difference('users(:test_user).tags.count', -1) do
        post tag_subscribe_path(params: {id: tags(:one).id}) 
        users(:test_user).reload
      end
    end
    
end