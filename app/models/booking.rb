class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_one :pick_up
  has_one :drop_off
  has_many :locations, through: :pick_up
  has_many :locations, through: :drop_off
end
