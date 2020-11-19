class Venue < ApplicationRecord
    has_many :showings, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :rows, presence: true, inclusion: {in: 1..20}
    validates :seats_per_row, presence: true, inclusion: {in: 1..20}
end