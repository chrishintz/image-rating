class User < ActiveRecord::Base
  has_many :photos
  has_secure_password
  validates :email, :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, :username

end
