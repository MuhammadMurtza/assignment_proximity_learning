# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.all.blank?
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nick_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    phone_number: "090-078-6010",
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code
  )
  5.times do
    user.employments.create(
      employer: Faker::Company.name,
      start_date: Faker::Date.between(from: 5.years.ago, to: 3.years.ago),
      end_date: Faker::Date.between(from: 2.years.ago, to: Date.yesterday)
    )
  end
end
