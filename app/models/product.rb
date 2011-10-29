class Product < ActiveRecord::Base
  belongs_to :category

  scope :recent, order("created_at DESC").limit(5)
  scope :search, lambda { |q| where("upper(name) like ?", "%#{q.upcase}%") }
  scope :new_arrivals, where(:new_arrival => true)

  validates :name, :presence => true, :uniqueness => true

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
