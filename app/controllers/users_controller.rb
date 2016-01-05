class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Welcome, thanks for signing up!"
    else
      render "index"
    end
  end
end
