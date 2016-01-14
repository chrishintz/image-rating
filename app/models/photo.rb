class Photo < ActiveRecord::Base
  mount_uploader :photo_url, ImageFileUploader
  belongs_to :user
  has_many :ratings
  validates :photo_url, presence: true
end
