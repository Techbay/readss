module Apis::V1
  class UsersController < ApplicationController
    include ::Authenticates

    protect_from_forgery with: :null_session
    before_action :authenticate_zone, only: [:add_reward, :subtract_reward]

    def add_reward
      return "vc_noreward" unless authenticate

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
      params[:amount]
    end

    def authenticate
      authenticate_zone(
        secret: ENV["ZONE_SECRET"],
        trans_id: params[:id],
        dev_id: params[:uid],
        amt: params[:amount],
        currency: params[:currency],
        open_udid: params[:open_udid],
        udid: params[:udid],
        odin1: params[:odin1],
        mac_sha1: params[:mac_sha1],
        result: params[:verifier]
      )
    end
  end
end
