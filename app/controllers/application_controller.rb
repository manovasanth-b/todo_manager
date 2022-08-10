class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success, :alert

  def current_user
    return @current_user if @current_user
    if session[:current_user_id] != nil
      current_user_id = session[:current_user_id]
      if current_user_id
        @current_user = User.find(current_user_id)
      else
        nil
      end
    end
  end
end
