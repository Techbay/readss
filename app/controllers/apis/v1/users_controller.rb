module Apis::V1
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session

    def add_reward
      ApiRequest.create(address: request.fullpath, from: request.env["HTTP_REFERER"])
      if User.first.add_reward(user_rewards)
        render text: "vc_success"
      else
        render text: "vc_noreward"
      end
    end

    def subtract_reward
      User.first.subtract_reward(user_rewards)
      render text: "vc_success"
    end

    private
    def user_rewards
      params[:reward]
    end
  end
end
