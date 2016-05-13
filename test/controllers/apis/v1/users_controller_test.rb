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
          id: "1462967567335",
          uid: "de53d51a-0260-4fcd-9708-ec10626837f0",
          amount: "1",
          currency: "Credits",
          open_udid: "",
          udid: "",
          odin1: "",
          mac_sha1: "",
          verifier: "779e0f9f1616061e1ea0fc2b9c9dc8f3",
          custom_id: users(:test_user).id
        )
      end
      assert_response :success
    end

    test "should add api request" do
      assert_difference 'ApiRequest.count', 1 do
        get apis_v1_add_reward_path(
          id: "1462967567335",
          uid: "de53d51a-0260-4fcd-9708-ec10626837f0",
          amount: "1",
          currency: "Credits",
          open_udid: "",
          udid: "",
          odin1: "",
          mac_sha1: "",
          verifier: "779e0f9f1616061e1ea0fc2b9c9dc8f3",
          custom_id: users(:test_user).id
        )
      end
      assert_response :success
    end
  end
end
