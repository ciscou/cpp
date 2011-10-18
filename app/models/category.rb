class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy

  validates :name, :presence => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
