# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "skeletizzle666", email: Faker::Internet.email, bio: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, location: "#{Faker::Address.city}, #{Faker::Address.state}", password: "123", password_confirmation: "123")

9.times do
  User.create(username: Faker::Internet.username, email: Faker::Internet.email, bio: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, location: "#{Faker::Address.city}, #{Faker::Address.state}", password: "123", password_confirmation: "123")
end

User.all.each do |user|
  3.times do
    user.items.build(description: Faker::Food.description, price: rand(48) + 9, size: "M", brand: Faker::Appliance.brand).save
  end
end
