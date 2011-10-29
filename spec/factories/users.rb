FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password              "s3cr3t"
    password_confirmation "s3cr3t"
    admin false
    premium false
  end
end
