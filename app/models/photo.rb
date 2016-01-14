class Photo < ActiveRecord::Base
  mount_uploader :photo_url, ImageFileUploader
  belongs_to :user
  has_many :ratings
  validates :photo_url, presence: true

  def self.by_votes
    select('ratings.*, coalesce(value, 0) as rating').
    joins('left join rating on photo.user_id=user_id'). #not sure about this line
    order('rating desc')
  end

  def votes
    read_attribute(:rating) || rating.average(:rating)
  end
end
