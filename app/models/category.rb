class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy

  mount_uploader :picture, PictureUploader
end
