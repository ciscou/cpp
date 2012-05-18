#encoding: utf-8

class Decoration
  DECORATIONS = {
    "household" => {
      "classic"        => "Clásico",
      "orange_olive"   => "Aceituna naranja",
      "blue_retro"     => "Retro azul",
      "poppy"          => "Amapola",
      "baecula"        => "Baécula",
      "multi_flower"   => "Multiflor",
      "granadine"      => "Granadino",
      "flowered"       => "Rameados",
      "red_olive"      => "Aceituna rojo",
      "green_retro"    => "Retro verde",
      "fantasy"        => "Fantasía",
      "red_edge"       => "Filo rojo",
      "olive_tree_r"   => "Oliva R",
      "strokes"        => "Trazos",
      "honey_poppy"    => "Amapola miel"
    },
    "gardering" => {
      "popular"        => "Popular",
      "poppy"          => "Amapola",
      "blue_retro"     => "Retro azul",
      "red_olive"      => "Aceituna rojo",
      "classic"        => "Clásico",
      "figs"           => "Higos",
      "olive_tree_r"   => "Oliva R",
      "blue_alhambra"  => "Alhambra azul",
      "baecula"        => "Baécula",
      "multi_flower"   => "Multiflor",
      "green_retro"    => "Retro verde",
      "brusheds"       => "Pincelados",
      "green_alhambra" => "Alhambra verde",
      "flowered"       => "Rameados",
      "fantasy"        => "Fantasía",
      "granadine"      => "Granadino"
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

  def self.all_with_tag(tag)
    with_tag(tag).keys.map do |code|
      Decoration.new(tag, code)
    end
  end

  def self.with_tag(tag)
    DECORATIONS[tag] || {}
  end

  def self.human_tag_name(tag)
    {
      "gardering" => "jardinería",
      "household" => "menaje"
    }[tag]
  end

  attr_reader :tag, :code

  def name
    self.class.with_tag(@tag)[@code]
  end
end
