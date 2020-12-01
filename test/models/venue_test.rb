require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  test 'should not save empty venue' do
    venue = Venue.new

    venue.save
    refute venue.valid?
  end

  test 'should save valid venue' do
    venue = Venue.new
    venue.name = "Test venue"
    venue.location = "Test location"
    venue.image_url = "www.exampleurl.com"
    venue.rows = 10
    venue.seats_per_row = 12

    venue.save
    assert venue.valid?
  end

  test 'should note save duplicate venue' do
    venue = Venue.new
    venue.name = "Test venue"
    venue.location = "Test location"
    venue.image_url = "www.exampleurl.com"
    venue.rows = 10
    venue.seats_per_row = 12

    venue.save
    assert venue.valid?

    venue2 = Venue.new
    venue2.name = "Test venue"
    venue2.location = "Test location"
    venue2.image_url = "www.exampleurl.com"
    venue2.rows = 10
    venue2.seats_per_row = 12

    venue2.save
    refute venue2.valid?
 
  end

end
