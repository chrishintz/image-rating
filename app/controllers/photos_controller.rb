class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    @users  = User.all
  end

  def add_a_photo
    @photo = Photo.new
  end

  def new
    @photo = Photo.new(photo_params)
    @photo.user_id = @current_user.id
    if @photo.save
      redirect_to single_photo_path(@photo.id)
    else
      render "add_a_photo"
    end
  end

  def show
    @photos = Photo.all
    @photo  = Photo.new
  end

  def single_photo
    @photo  = Photo.find(params[:id])
    @photos = Photo.all
  end

  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
  end

  def random
    @photos = Photo.all
  end

private

  def photo_params
    params.require(:photo).permit(:user_id, :photo_url, :description)
  end

end
