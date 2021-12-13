class Location < ApplicationRecord
  has_many :pick_ups
  has_many :drop_offs
  has_many :bookings, through: :pick_up
  has_many :bookings, through: :drop_off
end
