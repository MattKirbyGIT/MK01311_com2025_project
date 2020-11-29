require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    @showing = showings(:one)
    @film = films(:one)
    @showing.film_id = @film.id
  end

  test "should get new" do
    puts new_booking_url
    get new_booking_url, params: {showing: @showing.id}
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { booking: { E_ticket: @booking.E_ticket, email: @booking.email, name: @booking.name, row: @booking.row, seat: @booking.seat, showing_id: @showing.id } }
    end

    assert_redirected_to booking_url(Booking.last)
  end


  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end
  end
end
