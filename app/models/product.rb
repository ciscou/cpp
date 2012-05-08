require 'texticle/searchable'

class Product < ActiveRecord::Base
  include CarrierWavePictureRenamer
  extend Searchable(:name, :description)

  belongs_to :category

  scope :featured, order("random()").limit(5)
  scope :new_arrivals, where(:new_arrival => true).order("created_at desc")
  scope :with_decoration, lambda { |decoration_code| where(:decoration_code => decoration_code) if decoration_code.present? }

  validates :name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  mount_uploader :picture, PictureUploader

  def self.searchable_language
    'spanish'
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def decoration
    Decoration.new(decoration_code)
  end
end
