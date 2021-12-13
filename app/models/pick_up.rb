class PickUp < ApplicationRecord
  belongs_to :location
  belongs_to :booking
end
