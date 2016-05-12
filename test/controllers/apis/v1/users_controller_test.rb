require 'test_helper'

module Apis::V1
  class UsersControllerTest < ActionDispatch::IntegrationTest
    fixtures :users

    setup do
    end

    test "should add reward" do
      assert_difference 'User.first.reward', 100 do
        post apis_v1_add_reward_path(reward: 100)
      end
      assert_response :success
    end
  end
end
