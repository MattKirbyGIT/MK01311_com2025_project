json.extract! booking, :id, :showing_id, :name, :email, :seat, :row, :E_ticket, :created_at, :updated_at
json.url booking_url(booking, format: :json)
