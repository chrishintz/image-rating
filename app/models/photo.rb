class Photo < ActiveRecord::Base
  mount_uploader :photo_url, ImageFileUploader
end
