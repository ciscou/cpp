# encoding: utf-8

class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  SUBJECTS = [
    "Quiero poder ver las últimas novedades",
    "Petición de presupuesto",
    "Informe de incidencia",
    "Otro"
  ]

  attr_accessor :subject, :body

  validates :subject, :body, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
