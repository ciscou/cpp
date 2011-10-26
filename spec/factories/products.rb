FactoryGirl.define do
  factory :product do
    association :category
    name        { Faker::Lorem.sentence(3) }
    description { Faker::Lorem.paragraphs(2).join("\n\n") }
  end
end
