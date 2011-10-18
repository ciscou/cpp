class Product < ActiveRecord::Base
  belongs_to :category

  scope :recent, order("created_at DESC").limit(5)

  validates :name, :presence => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
