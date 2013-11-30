class Category < ActiveRecord::Base
  include CarrierWavePictureRenamer

  acts_as_list

  has_many :products, :dependent => :destroy

  validates :es_name, :presence => true, :uniqueness => true
  validates :picture, :presence => true

  default_scope -> { order(:position) }

  mount_uploader :picture, PictureUploader

  def name
    localized_name.presence || es_name
  end

  def description
    localized_description.presence || es_description
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def decorations
    Decoration.all_with_tag(decoration_tag)
  end

  private

  def localized_name
    send("#{I18n.locale}_name")
  end

  def localized_description
    send("#{I18n.locale}_description")
  end
end
