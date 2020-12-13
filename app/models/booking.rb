class Booking < ApplicationRecord
  # Booking assinged to exactly one showing
  belongs_to :showing
  # All fields validated so that they can't be null
  validates :name, presence: true
  validates :email, presence: true
  validates :seat, presence: true, inclusion: {in: 1..50}
  validates :row, presence: true,  inclusion: {in: 1..50}
  # E_ticket cant be unique since each booking only contains only one seat and will need same e ticket number as other bookings when multiple seats are selected.  
  validates :E_ticket, presence: true
end
