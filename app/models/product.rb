require 'texticle/searchable'

class Product < ActiveRecord::Base
  include CarrierWavePictureRenamer
  extend Searchable(:name, :description)

  belongs_to :category

  scope :featured, order("random()").limit(5)
  scope :new_arrivals, where(:new_arrival => true).order("created_at desc")

  default_scope order(:created_at).reverse_order

  validates :name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  mount_uploader :picture, PictureUploader

  def self.searchable_language
    'spanish'
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
