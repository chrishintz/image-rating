class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      ClubMailer.subscribe(@user.id).deliver_now
      redirect_to home_path, notice: "Welcome, thanks for signing up!"
    else
      flash.now.alert = "Username or Email is already taken"
      render "index"
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.save
    redirect_to user_photos_path
  end

  def user_photos
    @user   = User.find(session[:user_id])
    @photos = Photo.all
  end

end
