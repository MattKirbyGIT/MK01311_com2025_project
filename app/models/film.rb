class Film < ApplicationRecord
    # Film can have many showings
    has_many :showings, dependent: :destroy

    # validates presence for all fields
    validates :title, :description, :release_date, :running_time_mins, :image_url, presence: true
    # title must be unique
    validates :title, uniqueness: true
    # validates greater than 0
    validates :rating, :running_time_mins, numericality: {greater_than_or_equal_to: 0}
    # validating range
    validates :rating, inclusion: {in: 0..5}
    validates :minimum_age_restriction, inclusion: {in: 3..18}
    validates :running_time_mins, inclusion: {in: 30..300}
    # Ensures length must between min and max values.
    validates :title, length: { minimum: 1, maximum: 100 }  
    validates :description, length: { minimum: 1, maximum: 1000 }
end
