# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Artist.destroy_all
Event.destroy_all
Review.destroy_all


User.create!(email: "irma@irma.com", password: "lewagon")
User.create!(email: "erland.@erland.com", password: "lewagon")
User.create!(email: "francois@francois.com", password: "lewagon")
User.create!(email: "john@john.com", password: "lewagon")

10.times do
  Artist.create!(
    name: Faker::Name.name,
    description: Faker::Artist.name,
    location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample,
    price: [50, 100, 200, 400, 500].sample,
    genre: ["rock", "pop", "classical", "rap", "jazz"].sample,
    user_id: rand(1..4)
    )
end

10.times do
  Event.create!(
    name: ["party", "marriage", "baptism", "work event"].sample,
    description: "na",
    location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample,
    date: "na",
    event_type: ["party", "marriage", "baptism", "work event"].sample,
    user_id: rand(1..4),
    artist_id: rand(1..10)
    )
end

10.times do

Review.create!(
    description: ["Great", "Amazing musician!", "We had the best time"].sample,
    rating: rand(1..5),
    event_id: rand(1..10)
    )
end
