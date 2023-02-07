FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nick_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    phone_number { "090-078-6010" }
    street { Faker::Address.street_address }
  end
end
