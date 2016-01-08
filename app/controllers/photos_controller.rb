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
    if @photo.save
      redirect_to show_photos_path
    else
      render "add_a_photo"
    end
  end

  def show
    @photos = Photo.all
  end

private

  def photo_params
    params.require(:photo).permit(:user_id, :photo_url, :description)
  end

end
