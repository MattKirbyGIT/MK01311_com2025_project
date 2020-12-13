require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  
  # Should not save a booking if not all parameters are provided.
  test 'should not save empty booking' do
    booking = Booking.new
    booking.save
    
    refute booking.valid?
  end

  # Test that expects to save a vaild booking since all parameters are valid and present.
  test 'should save valid booking' do
    booking = Booking.new
    booking.name = "Name"
    booking.email = "Test@Test.com"
    booking.seat  = 1
    booking.row = 2
    booking.showing = showings(:one)
    booking.E_ticket ="AAAAAAA"
    booking.save
    assert booking.valid?

  end

  #the first booking oibject will save since it has all params are valid.
  #The second booking object will not save since it has a duplicate parameter value which should be unique.
  test 'should save a booking with a duplicate e_ticket' do
    booking = Booking.new
    booking.name = "Name"
    booking.email = "Test@Test.com"
    booking.seat  = 1
    booking.row = 2
    booking.showing = showings(:one)
    booking.E_ticket ="AAAAAAA"
    booking.save
    assert booking.valid?

    booking2 = Booking.new
    booking2.name = "Name"
    booking2.email = "Test@Test.com"
    booking2.seat  = 1
    booking2.row = 2
    booking2.showing = showings(:one)
    booking2.E_ticket ="AAAAAAA"
    booking2.save
    #Booking2 will not save 
    assert booking2.valid?
  
  end

end
