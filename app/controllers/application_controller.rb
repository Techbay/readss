class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_id
    if current_user
      render plain: current_user.id
    else
      render plain: "no_user"
    end
  end
end
