FactoryBot.define do
  factory :employment do
    employer { Faker::Company.name }
    start_date { Faker::Date.between(from: 5.years.ago, to: 3.years.ago) }
    end_date { Faker::Date.between(from: 2.years.ago, to: Date.yesterday) }
    association :users, factory: :users
  end
end
