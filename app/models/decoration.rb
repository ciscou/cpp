class Decoration
  DECORATIONS = {
    "household" => {
      "classic"      => "Clásico",
      "orange_olive" => "Aceituna naranja",
      "retro"        => "Retro",
      "poppy"        => "Amapola",
      "baecula"      => "Baécula",
      "multi_flower" => "Multiflor",
      "granadine"    => "Granadino",
      "flowered"     => "Rameados",
      "red_olive"    => "Aceituna rojo",
      "fantasy"      => "Fantasía",
      "red_edge"     => "Filo rojo",
      "olive_tree_r" => "Oliva R",
      "strokes"      => "Trazos",
      "honey_poppy"  => "Amapola miel",
      "blue_orange"  => "Blue orange",
      "alhambra"     => "Alhambra"
    },
    "gardering" => {
      "popular"      => "Popular",
      "poppy"        => "Amapola",
      "retro"        => "Retro",
      "red_olive"    => "Aceituna rojo",
      "classic"      => "Clásico",
      "figs"         => "Higos",
      "olive_tree_r" => "Oliva R",
      "alhambra"     => "Alhambra",
      "baecula"      => "Baécula",
      "multi_flower" => "Multiflor",
      "brusheds"     => "Pincelados",
      "flowered"     => "Rameados",
      "fantasy"      => "Fantasía",
      "granadine"    => "Granadino",
      "blue_orange"  => "Blue orange"
    }
  }

  def initialize(tag, code)
    @tag, @code = tag, code
  end

  def self.all
    DECORATIONS.keys.flat_map do |tag|
      all_with_tag(tag)
    end
  end

  def self.all_including_products_count
    products = Product.joins(:category).
      group(:decoration_tag, :decoration_code).order("count_all desc").count
    decorations = products.map do |(decoration_tag, decoration_code), products_count|
      new(decoration_tag, decoration_code).tap do |decoration|
        decoration.products_count = products_count
      end
    end
    decorations.select(&:exists?)
  end

  def self.all_with_tag(tag)
    with_tag(tag).keys.map do |code|
      Decoration.new(tag, code)
    end
  end

  def self.with_tag(tag)
    DECORATIONS[tag] || {}
  end

  def self.find_by_tag_and_code(tag, code)
    new(tag, code)
  end

  def self.find_by_tag_and_code!(tag, code)
    decoration = find_by_tag_and_code(tag, code)
    raise ActiveRecord::RecordNotFound unless decoration.exists?

    decoration
  end

  def self.human_tag_name(tag)
    {
      "gardering" => "jardinería",
      "household" => "menaje"
    }[tag]
  end

  attr_accessor :products_count
  attr_reader :tag, :code

  def name
    self.class.with_tag(@tag)[@code]
  end

  def exists?
    name.present?
  end
end
