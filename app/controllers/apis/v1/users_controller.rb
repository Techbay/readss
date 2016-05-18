module Apis::V1
  class UsersController < ApplicationController
    include ::Authenticates

    protect_from_forgery with: :null_session
    # before_action :authenticate, only: [:add_reward, :subtract_reward]

    def add_reward
      if ar = ApiRequest.find_by(trans_id: params[:id])
        render plain: "vc_success" and return
      else
        ApiRequest.create(trans_id: params[:id], address: request.fullpath, from: request.env["HTTP_REFERER"])
      end

      if user = User.find(params[:custom_id]) and user.add_reward(user_rewards)
        render plain: "vc_success"
      else
        render plain: "vc_noreward"
      end
    end

    def subtract_reward
      User.first.subtract_reward(user_rewards)
      render plain: "vc_success"
    end

    private
    def user_rewards
      params[:amount]
    end

    def authenticate
      unless authenticate_zone(
        secret: ENV["ZONE_SECRET"],
        trans_id: params[:id],
        dev_id: params[:uid],
        amt: params[:amount],
        currency: params[:currency],
        open_udid: params[:open_udid],
        udid: params[:udid],
        odin1: params[:odin1],
        mac_sha1: params[:mac_sha1],
        result: params[:verifier],
        custom_id: params[:custom_id]
      )
        render plain: "vc_noreward" and return
      end
    end
  end
end
