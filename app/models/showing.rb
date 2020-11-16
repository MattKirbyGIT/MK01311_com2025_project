class Showing < ApplicationRecord
  belongs_to :film
  has_and_belongs_to_many :venues
  validates :date, :time, :film, presence: true
end
