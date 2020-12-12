class Venue < ApplicationRecord
    # Venue has many showings (Many to one)
    has_many :showings, dependent: :destroy
    # Name cannot be null and must be unique
    validates :name, presence: true, uniqueness: true
    # Row must not be null, nit be within 1 and 50
    validates :rows, presence: true, inclusion: {in: 1..50}
    # seats must not be null, nit be within 1 and 50
    validates :seats_per_row, presence: true, inclusion: {in: 1..50}
end