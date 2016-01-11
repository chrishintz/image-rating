class Photo < ActiveRecord::Base
  mount_uploader :photo_url, ImageFileUploader
  belongs_to :user
  validates :photo_url, presence: true
end
