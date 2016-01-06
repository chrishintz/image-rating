class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def add_a_photo
    @photo = Photo.new(photo_params)
  end

  def new
    @photo = Photo.new
  end

private

  def photo_params
    params.require(:photo).permit(:photo_url, :description, :user_id)
  end

end
