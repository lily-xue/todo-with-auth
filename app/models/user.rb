class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  mount_uploader :avatar,AvatarUploader
end
