module PagesHelper
  def how_we_work_images
    (0..9).reject { |i| i.in?(2, 4) }.map { |i| "DPP_100#{i}" } +
    (10..17).map { |i| "DPP_10#{i}" } +
    %w[1 ANA JUANJO maria _MG_0390 _MG_0397 paqui TAMIA_1]
  end
end
