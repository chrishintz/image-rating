class RatingsController < ApplicationController

  def create
    @rating = Rating.new
    @photo  = Photo.new
    if params[:rating] == "bad"
      @rating.rating = -1
    elsif params[:rating] == "meh"
      @rating.rating = 0
    elsif params[:rating] == "good"
      @rating.rating = 1
    end
    @rating.comment  = params[:comment]
    @rating.photo_id = params[:id]
    @rating.user_id  = @current_user.id
    if @rating.save
      redirect_to home_path
    else
      @photo = Photo.find(params[:photo_id])
      render "/photos/show"
    end
  end
end
