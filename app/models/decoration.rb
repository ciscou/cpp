#encoding: utf-8

class Decoration
  DECORATIONS = {
    "popular"              => "Popular",
    "classic"              => "Clásico",
    "228"                  => "228",
    "207"                  => "207",
    "carmen"               => "Carmen",
    "honey_c1"             => "Miel C1",
    "figs"                 => "Higos",
    "olive_tree_r"         => "Oliva R",
    "222"                  => "222",
    "smoot_brushed_colors" => "Colores pincelados lisos",
    "blue_alhambra"        => "Alhambra azul",
    "green_alhambra"       => "Alhambra verde",
    "blue_retro"           => "Retro azul",
    "green_retro"          => "Retro verde",
    "olive_r"              => "Aceituna R",
    "baecula"              => "Baécula",
    "multi_flower"         => "Multiflor"
  }

  def initialize(code)
    @code = code
  end

  def self.codes_to_mask(codes)
    codes.
      select(&:present?).
      map { |c| 2 ** DECORATIONS.keys.reverse.index(c) }.
      inject(0, :+).
      to_s(2).
      rjust(DECORATIONS.size, "0")
  end

  def self.mask_to_codes(mask)
    (mask || "0" * DECORATIONS.size).
      each_char.
      map(&:to_i).
      each_with_index.
      select { |c, _| c == 1 }.
      map { |_, i| DECORATIONS.keys[i] }
  end

  attr_reader :code

  def name
    DECORATIONS[@code]
  end
end
