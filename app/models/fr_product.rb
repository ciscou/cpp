require 'textacular/searchable'

class FrProduct < Product
  extend Searchable(:fr_name, :fr_description)

  def self.model_name
    Product.model_name
  end

  def self.searchable_language
    'french'
  end
end
