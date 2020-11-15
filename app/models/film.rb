class Film < ApplicationRecord
    has_many :showings, dependent: :destroy
    validates :title, :description, :release_date, :running_time_mins, :image_url, presence: true
    validates :title, uniqueness: true
    validates :rating, :running_time_mins, numericality: {greater_than_or_equal_to: 0}
    validates :rating, inclusion: {in: 0..5}
    validates :minimum_age_restriction, inclusion: {in: 3..18}
    validates :running_time_mins, inclusion: {in: 30..300}
    validates :title, length: { minimum: 1, maximum: 100 }  
    validates :description, length: { minimum: 1, maximum: 1000 }
end
