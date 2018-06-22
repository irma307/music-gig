# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Event.destroy_all
Artist.destroy_all
User.destroy_all


User.create!(email: "irma@irma.com", password: "lewagon", location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample)
User.create!(email: "erland@erland.com", password: "lewagon", location: ['Brussels', 'Antwerp', 'Ghent', 'Liege', 'Charleroi'].sample)
User.create!(email: "francois@francois.com", password: "lewagon", location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample)
User.create!(email: "john@john.com", password: "lewagon", location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample)

10.times do
  Artist.create!(
    name: Faker::Artist.name,
    description: Faker::Hipster.paragraph,
    location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample,
    price: [50, 100, 200, 400, 500].sample,
    genre: ["rock", "pop", "classical", "rap", "jazz"].sample,
    user: User.all.sample
    )
end

10.times do
  Event.create!(
    name: ["party", "wedding", "baptism", "work event"].sample,
    description: "For this event we really want our guests to have a great time. Ideally we would like the band to generate a festive atmosphere whithout the event turning into a dancing party. We relly believe the artist is going to play a big role for such a request",
    location: ["Brussels", "Antwerp", "Ghent", "Liege", "Charleroi"].sample,
    date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    event_type: ["party", "marriage", "baptism", "work event"].sample,
    status: "pending",
    user: User.all.sample,
    artist: Artist.all.sample
    )
end

Event.all.each do |event|
  rand(1..15).times do
    Review.create!(
      description: ["This band rocked. Our guests loved them and everyone had a blast. They read the crowd perfectly and got everyone dancing.They were super flexible and easy to work with.", "Great experience and fabulous music!", "I can't believe I am the first review for them on here, though I guess they play lots of other places besides weddings. I also realize that how much your crowd dances does depend a bit on your guests - but we were on the dance floor ALL NIGHT LONG. They read the crowd so well I will never forget. They were super accommodating with our song choices and played a great mix of music - they pulled me up to sing with my bridesmaids and it was SO MUCH FUN!", "Such a fun band and were exactly what we wanted. A wonderful mix of new and oldies music. They new exactly how to read the crowd and played music that everyone enjoyed! Loved them!", "Very professional, affordable and reliable", "Great musicians, fabulous vocals. Get ready to dance. Highly recommend!", "The band was amazing, and they let the funk roll.", "We went back and forth for months on finding a band. We didn't have time to go see any in person but SoundBMB listened to our needs and budget and recommended them. We LOVED them! We had a packed dance floor for the full night and our family and friends are still raving about how great our band was. We were so happy with booked them. Our event was mostly 30 - 60 crowd (we are about 30 ourselves) and everyone had a great time.", "This was my first experience with booking a live band. They were more than accommodating and went above and beyond."].sample,
      rating: rand(3..5),
      event: event
     )
  end
end



