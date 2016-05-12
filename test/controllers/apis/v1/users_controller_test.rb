require 'test_helper'

module Apis::V1
  class UsersControllerTest < ActionDispatch::IntegrationTest
    include ::Authenticates
    fixtures :users

    setup do
    end

    test "should add reward" do
      assert_difference 'User.first.reward', 1 do
        get apis_v1_add_reward_path(
          id: "1462967567326",
          uid: "ed8418d2-fcc4-460d-aea3-7fd30b6f7bbd",
          amount: "1",
          currency: "Credits",
          open_udid: "",
          udid: "",
          odin1: "",
          mac_sha1: "",
          verifier: "d5e69955b4a5f6de5089ad00d79de38b"
        )
      end
      assert_response :success
    end

    test "should add api request" do
      assert_difference 'ApiRequest.count', 1 do
        get apis_v1_add_reward_path(
          id: "1462967567326",
          uid: "ed8418d2-fcc4-460d-aea3-7fd30b6f7bbd",
          amount: "1",
          currency: "Credits",
          open_udid: "",
          udid: "",
          odin1: "",
          mac_sha1: "",
          verifier: "d5e69955b4a5f6de5089ad00d79de38b"
        )
      end
      assert_response :success
    end
  end
end
