class Rating < ActiveRecord::Base
  belongs_to :photo
  validates_uniqueness_of :photo_id, scope: :user_id
  validates_inclusion_of :rating, in: [1, 0, -1]
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "This is your photo" if photo.user_id == user_id
  end
end
