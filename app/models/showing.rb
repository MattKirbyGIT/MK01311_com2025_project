class Showing < ApplicationRecord
  belongs_to :film
  belongs_to :venue
  validates :time, presence: true
  validates :price, presence: true
end
