class Desk < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
