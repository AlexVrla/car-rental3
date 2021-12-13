require 'faker'

if Rails.env.development?
  puts "Cleaning database..."
  Car.destroy_all
  User.destroy_all
  Location.destroy_all
  Booking.destroy_all
end

#Cars seeds
puts "Creating DB..."
puts "Creating cars..."

Lexus_LS = Car.create!({ brand: 'Lexus', model: 'LS', price_per_day: 95, rental_status: 'available'})
Renault_Espace = Car.create!({ brand: 'Renault', model: 'Espace', price_per_day: 95, rental_status: 'available'})
Cadillac_Escalade = Car.create!({ brand: 'Cadillac', model: 'Escalade', price_per_day: 135, rental_status: 'available'})
Cadillac_Lowrider = Car.create!({ brand: 'Cadillac', model: 'Lowrider', price_per_day: 135, rental_status: 'available'})
Fiat_Punto = Car.create!({ brand: 'Fiat', model: 'Punto', price_per_day: 65, rental_status: 'rented'})
95.times do
  car = Car.create!({ brand: Faker::Vehicle.make, model: Faker::Vehicle.model, price_per_day: rand(55..145).round, rental_status: ['available', 'rented'].sample })
end
puts "Cars created!"

#Locations seeds
puts "Creating locations..."
20.times do
  location = Location.create!({ agency_name: Faker::Company.name, city: Faker::Address.city})
end
puts "Locations created"

#Users seeds
puts "Creating users..."
100.times do
  user = User.create!({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, date_of_birth: Faker::Date.birthday})
end
puts "Users created"

#Bookings seeds
puts "Creating fake bookings..."
50.times do
  booking = Booking.create!({ departure_date: Faker::Date.in_date_period(year: 2018, month: 7), arrival_date: Faker::Date.in_date_period(year: 2019, month: 7), departure_time: rand(24), arrival_time: rand(24), user_id: rand(1..100), car_id: rand(1..100)})
end
puts "Fake bookings created!"

#Pick-ups seeds
puts "Creating fake pick-ups..."
Location.all.each do |location|
  pick_up = PickUp.create!({location_id: location.id, booking_id: rand(1..20)})
end
puts "Fake pick-ups created!"

#Drop-offs seeds
puts "Creating fake drop-offs..."
Location.all.each do |location|
  drop_off = DropOff.create!({location_id: location.id, booking_id: rand(1..20)})
end
puts "Fake drop-offs created!"
