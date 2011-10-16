class Category < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
