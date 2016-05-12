module Apis::V1
  class UsersController < ApplicationController

    def add_reward
      User.first.add_reward(user_rewards)
    end

    def subtract_reward
      User.first.subtract_reward(user_rewards)
    end

    private
    def user_rewards
      params[:reward]
    end

  end
end
