FactoryGirl.define do
  factory :category do
    name        { Faker::Lorem.sentence(3) }
    description { Faker::Lorem.paragraphs(2).join("\n\n") }
  end
end
