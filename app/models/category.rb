class Category < ActiveRecord::Base
  include CarrierWavePictureRenamer

  acts_as_list

  has_many :products, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  default_scope order(:position)

  mount_uploader :picture, PictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def decorations
    Decoration.all_with_tag(decoration_tag)
  end
end
