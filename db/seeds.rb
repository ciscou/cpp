# encoding: utf-8

require 'ffaker'

cazuelas = Category.create!(
  :name => "Cazuelas",
  :description => Faker::Lorem.paragraphs(2).join("\n\n"),
  :remote_picture_url => "http://ceramicapadilla.es/cazuelas/images/dpp_0001.jpg"
)

1.upto(7) do |i|
  cazuelas.products.create!(
    :name => Faker::Lorem.sentence(3),
    :description => Faker::Lorem.paragraphs(2).join("\n\n"),
    :remote_picture_url => "http://ceramicapadilla.es/cazuelas/images/dpp_000#{i}.jpg"
  )
end

jardineria = Category.create!(
  :name => "Jardinería",
  :description => Faker::Lorem.paragraphs(2).join("\n\n"),
  :remote_picture_url => "http://ceramicapadilla.es/jardin/images/067.jpg"
)

%w(
  067
  078
  088
  099
  110
  118
  119
  120
  121
  068
  069
  070
  071
  072
  073
  074
  075
  076
  077
  079
  080
  081
  082
  083
  084
  085
  086
  087
  089
  090
  091
  092
  093
  094
  095
  096
  097
  098
  100
  101
  102
  103
  104
  105
  106
  107
  109
  108
  111
  112
  113
  114
  115
  116
  117
).each do |i|
  jardineria.products.create!(
    :name => Faker::Lorem.sentence(3),
    :description => Faker::Lorem.paragraphs(2).join("\n\n"),
    :remote_picture_url => "http://ceramicapadilla.es/jardin/images/#{i}.jpg"
  )
end
