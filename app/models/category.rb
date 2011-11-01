class Category < ActiveRecord::Base
  include CarrierWavePictureRenamer

  has_many :products, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
