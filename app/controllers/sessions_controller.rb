class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to todos_path
    else
      render "new"
    end
  end

  def create
    if current_user
      redirect_to todos_path
    else
      user = User.find_by(:email_address => params[:email_address])
      begin
        if user && user.authenticate(params[:password])
          session[:current_user_id] = user.id
          redirect_to todos_path
        else raise "Error: Incorrect Email or Password!!"         end
      rescue Exception => e
        flash[:notice] = e.message
        redirect_to new_signin_path
      end
    end
  end

  def delete
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
