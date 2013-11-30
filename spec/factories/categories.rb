FactoryGirl.define do
  factory :category do
    es_name        { Faker::Lorem.sentence(3) }
    es_description { Faker::Lorem.paragraphs(2).join("\n\n") }
    picture        { File.new(Rails.root.join("spec", "acceptance", "data", "example_picture.jpg")) }
  end
end
