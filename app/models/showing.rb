class Showing < ApplicationRecord
  # Showing has exactly one film and one venue
  belongs_to :film
  belongs_to :venue
  # Both may not be null
  validates :time, presence: true
  validates :price, presence: true
end
