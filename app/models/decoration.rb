#encoding: utf-8

class Decoration
  DECORATIONS = {
    "gardering" => {
      "popular"              => "Popular",
      "classic"              => "Clásico",
      "228"                  => "228",
      "207"                  => "207",
      "carmen"               => "Carmen",
      "honey_c1"             => "Miel C1",
      "figs"                 => "Higos",
      "olive_tree_r"         => "Oliva R",
      "222"                  => "222",
      "smooth_brushed_colors" => "Colores pincelados lisos",
      "blue_alhambra"        => "Alhambra azul",
      "green_alhambra"       => "Alhambra verde",
      "blue_retro"           => "Retro azul",
      "green_retro"          => "Retro verde",
      "poppy"                => "Amapola",
      "baecula"              => "Baécula",
      "multi_flower"         => "Multiflor",
      "mabe"                 => "Mabe",
      "bicolor"              => "Bicolor",
      "granadine"            => "Granadino"
    },
    "household" => {
      "ej1" => "Ejemplo 1",
      "ej2" => "Ejemplo 2",
      "ej3" => "Ejemplo 3"
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

  attr_reader :tag, :code

  def name
    self.class.with_tag(@tag)[@code]
  end
end
