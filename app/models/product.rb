class Product < ActiveRecord::Base
  include CarrierWavePictureRenamer

  belongs_to :category, touch: true

  scope :featured, -> { order("random()").limit(6) }
  scope :new_arrivals, -> { where(new_arrival: true).order("created_at desc") }
  scope :with_decoration, ->(decoration) {
    joins(:category).where(categories: { decoration_tag: decoration.tag },
                           decoration_code: decoration.code)
  }

  validates :es_name, presence: true, uniqueness: true
  validates :picture, presence: true

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

  def decoration
    Decoration.find_by_tag_and_code(category.decoration_tag, decoration_code)
  end

  private

  def localized_name
    send("#{I18n.locale}_name")
  end

  def localized_description
    send("#{I18n.locale}_description")
  end
end
