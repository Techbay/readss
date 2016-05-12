module Apis::V1
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session

    def add_reward
      ApiRequest.create(address: request.fullpath, from: request.env["HTTP_REFERER"])
      User.first.add_reward(user_rewards)
      render text: "success"
    end

    def subtract_reward
      User.first.subtract_reward(user_rewards)
      render text: "success"
    end

    private
    def user_rewards
      params[:reward]
    end
  end
end
