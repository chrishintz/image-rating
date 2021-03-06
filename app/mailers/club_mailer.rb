class ClubMailer < ApplicationMailer
  default from: "chrishintz42@gmail.com"

  def subscribe(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Thanks for signing up for Image Rating!")
  end

  def rating_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "New rating on one of your photos!")
  end
end
