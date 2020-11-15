class Showing < ApplicationRecord
  belongs_to :film
  validates :venue, :date, :time, :rows, :seats_per_row, presence: true
  validates :venue, uniqueness: true
  validates :rows, :seats_per_row, inclusion: {in: 5..20}
end
