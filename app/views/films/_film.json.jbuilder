json.extract! film, :id, :title, :description, :release_date, :running_time_mins, :minimum_age_restriction, :image_url, :rating, :created_at, :updated_at
json.url film_url(film, format: :json)
