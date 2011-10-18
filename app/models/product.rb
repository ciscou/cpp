class Product < ActiveRecord::Base
  belongs_to :category

  validates :name, :presence => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
