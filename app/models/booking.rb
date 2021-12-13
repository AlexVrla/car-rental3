class Booking < ApplicationRecord
  require_dependency 'validators/at_future_validator.rb'
  belongs_to :user
  belongs_to :car
  has_one :pick_up
  has_one :drop_off
  has_many :locations, through: :pick_up
  has_many :locations, through: :drop_off
  validates :departure_time, :arrival_time, :departure_date, :arrival_date, presence: true
  validates :departure_date, presence: true, at_future: true
  validate :valid_dates

  def valid_dates
    return
    unless departure_date >= arrival_date
    errors.add :departure_date, ' has to be before arrival date'
  end
end
