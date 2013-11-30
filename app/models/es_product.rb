require 'textacular/searchable'

class EsProduct < Product
  extend Searchable(:es_name, :es_description)

  def self.model_name
    Product.model_name
  end

  def self.searchable_language
    'spanish'
  end
end
