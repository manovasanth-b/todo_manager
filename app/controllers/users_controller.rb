class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render plain: "Available users -> \n#{User.order(:user_name).map { |user| user.format_user }.join("\n")}"
  end

  def add_user
    user_params = params.require(:user).permit(:email_address, :user_name, :password)

    created_user = User.create!(user_params)
    rendered_text = created_user.id != nil ? "#{created_user[:user_name]} successfully created!!" : "Error: on creating user"
    render plain: rendered_text
  end

  def update_user
    user = User.find(params[:id])
    user.user_name = params[:user_name] != nil ? params[:user_name] : user.user_name
    user.email_address = params[:email_address] != nil ? params[:email_address] : user.email_address
    user.password = params[:password] != nil ? params[:password] : user.password
    user.save
    rendered_text = user.id != nil ? "#{user[:id]} User has been successfully updated!!" : "Error: on updating user"
    render plain: "#{rendered_text} "
  end

  def auth
    user = User.find_by(:email_address => params[:email_address])

    rendered_text = user != nil && params[:password] != nil && user.password == params[:password] ? "Authorized Successfully" : "Error : 500 /Not Authorized "
    render plain: "#{rendered_text} "
  end
end
