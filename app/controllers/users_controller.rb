class UsersController < ApplicationController
  def index
    render plain: "Available users -> \n#{User.order(:user_name).map { |user| user.format_user }.join("\n")}"
  end

  def signup_page
    render "new"
  end

  def login_page
    render "login"
  end

  def add_user
    user_params = params.permit(:email_address, :firstname, :password, :lastname)
    begin
      if User.find_by(:email_address => params[:email_address])
        raise "Error : User with #{params[:email_address]} already exist!!"
      end
      @user = User.new(
        email_address: user_params[:email_address],
        password: user_params[:password],
        lastname: user_params[:lastname],
        firstname: user_params[:firstname],
        user_name: "#{user_params[:firstname]} #{user_params[:lastname][0]}",
      )
      if @user.save
      else raise "#{@user.errors.full_message}"       end
    rescue Exception => e
      flash[:alert] = e.message
      redirect_to users_new_path
    else
      flash[:notice] = "Your Profile has been created!!"

      redirect_to new_signin_path
    end
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
end
