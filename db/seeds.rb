# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "🧹 Cleaning database..."
Booking.destroy_all
FlatReview.destroy_all
Flat.destroy_all
User.destroy_all
puts "✅ Database cleaned!"

# === USERS ===
puts "👤 Creating users..."
10.times do
  User.create!(
    username: Faker::Internet.unique.username,
    password: "password", # à remplacer par un système sécurisé en prod
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "✅ Created #{User.count} users!"

# === FLATS (autour de Bordeaux) ===
puts "🏠 Creating flats with real addresses around Bordeaux..."

addresses = [
  { address: "35 Rue Saint-Rémi, 33000 Bordeaux", lat: 44.841225, lon: -0.573424 },
  { address: "21 Rue Judaïque, 33000 Bordeaux", lat: 44.837945, lon: -0.583974 },
  { address: "1 Place de la Bourse, 33000 Bordeaux", lat: 44.841705, lon: -0.569932 },
  { address: "Rue du Loup, 33000 Bordeaux", lat: 44.839777, lon: -0.574431 },
  { address: "19 Cours Pasteur, 33000 Bordeaux", lat: 44.837141, lon: -0.576021 },
  { address: "Rue Sainte-Catherine, 33000 Bordeaux", lat: 44.837768, lon: -0.575066 },
  { address: "50 Quai Richelieu, 33000 Bordeaux", lat: 44.839722, lon: -0.567805 },
  { address: "23 Rue Camille Godard, 33000 Bordeaux", lat: 44.851203, lon: -0.563470 },
  { address: "Avenue des 40 Journaux, 33300 Bordeaux", lat: 44.869243, lon: -0.564225 },
  { address: "2 Rue Charles Chaigneau, 33300 Bordeaux", lat: 44.872591, lon: -0.557944 }
]

addresses.each do |a|
  Flat.create!(
    name: "#{Faker::Address.community} Apartment",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: a[:address],
    price: rand(60..250),
    longitude: a[:lon],
    lattitude: a[:lat],
    user: User.all.sample
  )
end
puts "✅ Created #{Flat.count} flats!"

# === BOOKINGS ===
puts "📅 Creating bookings..."
30.times do
  start_date = Faker::Date.forward(days: rand(3..15))
  end_date = start_date + rand(1..7)

  Booking.create!(
    start_date: start_date.to_time.to_i,
    end_date: end_date.to_time.to_i,
    user: User.all.sample,
    flat: Flat.all.sample
  )
end
puts "✅ Created #{Booking.count} bookings!"

# === REVIEWS ===
puts "📝 Creating reviews..."
40.times do
  FlatReview.create!(
    comment: Faker::Lorem.sentence(word_count: rand(6..12)),
    rating: rand(1..5),
    user: User.all.sample,
    flat: Flat.all.sample
  )
end
puts "✅ Created #{FlatReview.count} reviews!"

puts "🌱 Seeding completed with success!"
