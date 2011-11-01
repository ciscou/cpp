class Product < ActiveRecord::Base
  include CarrierWavePictureRenamer

  belongs_to :category

  scope :featured, order("random()").limit(5)
  scope :search, lambda { |q| where("upper(name) like ?", "%#{q.upcase}%") }
  scope :new_arrivals, where(:new_arrival => true).order("created_at desc")

  validates :name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
