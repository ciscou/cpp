class Decoration
  DECORATIONS = {
    "bla" => "Bla",
    "ble" => "Ble",
    "bli" => "Bli",
    "blo" => "Blo"
  }

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
end
