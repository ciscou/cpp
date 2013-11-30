require 'textacular/searchable'

class EnProduct < Product
  extend Searchable(:en_name, :en_description)

  def self.model_name
    Product.model_name
  end

  def self.searchable_language
    'english'
  end
end
