require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # Should not save a venue if not all parameters are present
  test 'should not save empty venue' do
    venue = Venue.new
    venue.save
    refute venue.valid?
  end

  # Should save a venue if all parameters are valid.
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

  # Should not save a venue with a duplicate title and location.
  test 'should note save duplicate venue' do
    venue = Venue.new
    venue.name = "Test venue"
    venue.location = "Test location"
    venue.image_url = "www.exampleurl.com"
    venue.rows = 10
    venue.seats_per_row = 12

    # First venue will save since all required fields are present and unique if needed.
    venue.save
    assert venue.valid?

    # Second venue has no unique fields.
    venue2 = Venue.new
    venue2.name = "Test venue"
    venue2.location = "Test location"
    venue2.image_url = "www.exampleurl.com"
    venue2.rows = 10
    venue2.seats_per_row = 12

    # Hence second venue will not save.
    venue2.save
    refute venue2.valid?
 
  end

end
