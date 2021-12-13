class Car < ApplicationRecord
  has_many :users, through: :booking
  has_many :bookings
end
