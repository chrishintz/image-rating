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
      ClubMailer.rating_email(Photo.find(@rating.photo_id).user_id).deliver_now
      redirect_to review_images_path
    else
      @photo = Photo.find(params[:photo_id])
      render "/photos/show"
    end
  end

  def review_images
    reviewed = Photo.joins(:ratings).where(["ratings.user_id = ?", @current_user.id])
    other_user_photos = Photo.all.where.not(user_id: @current_user.id)
    unreviewed = other_user_photos - reviewed
    @photo = unreviewed.shuffle.first
  end

end
