require 'test_helper'

module Apis::V1
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include ::Authenticates
    fixtures :users

    setup do
    end

    test "authenticate" do
      assert authenticate_zone(
        secret: ENV["ZONE_SECRET"],
        trans_id: "1462967567326",
        dev_id: "ed8418d2-fcc4-460d-aea3-7fd30b6f7bbd",
        amt: "1",
        currency: "Credits",
        open_udid: "",
        udid: "",
        odin1: "",
        mac_sha1: "",
        result: "d5e69955b4a5f6de5089ad00d79de38b"
      )
    end

    test "should add reward" do
      assert_difference 'User.first.reward', 100 do
        post apis_v1_add_reward_path(reward: 100)
      end
      assert_response :success
    end

    test "should add api request" do
      assert_difference 'ApiRequest.count', 1 do
        post apis_v1_add_reward_path(reward: 100)
      end
      assert_response :success
    end
  end
end
