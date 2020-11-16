class Venue < ApplicationRecord
    has_and_belongs_to_many :showings
    validates :name, presence: true, uniqueness: true
    validates :rows, presence: true, inclusion: {in: 1..20}
    validates :seats_per_row, presence: true, inclusion: {in: 1..20}
end

