json.extract! venue, :id, :name, :location, :image_url, :rows, :seats_per_row, :created_at, :updated_at
json.url venue_url(venue, format: :json)
