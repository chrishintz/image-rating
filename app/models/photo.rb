class Photo < ActiveRecord::Base
  mount_uploader :photo_url, ImageFileUploader
  belongs_to :user
end
