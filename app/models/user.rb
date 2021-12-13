class User < ApplicationRecord
  has_many :bookings
  has_many :cars, through: :booking
end
