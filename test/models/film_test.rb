require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  # Test that expects to not save a valid film due to lack of required parameters.
  test 'should not save empty film' do
    film = Film.new
    film.save
    refute film.valid?
  end

  # Test that expects to save a vaild film since all parameters are valid and present.
  test 'should save valid film' do
    film = Film.new
    film.title = "new film"
    film.description = "My film description"
    film.release_date = Date.parse('12th Feb 2021')
    film.running_time_mins = 100
    film.minimum_age_restriction = 12
    film.rating = 2.5
    film.image_url = 'https://image.jpg'
    film.save
    assert film.valid?

  end

  # Test that sholdnot save the second film since film titles have to be unique
  test 'should not save duplicate note Title' do
    film1 = Film.new
    film1.title = "new film"
    film1.description = "My film description"
    film1.release_date = Date.parse('12th Feb 2021')
    film1.running_time_mins = 100
    film1.minimum_age_restriction = 12
    film1.rating = 2.5
    film1.image_url = 'https://image.jpg'
    film1.save

    # Second film wont save since its title is a duplicated of the previous film.
    film2 = Film.new
    film2.title = "new film"
    film2.description = "My film description"
    film2.release_date = Date.parse('12th Feb 2021')
    film2.running_time_mins = 100
    film2.minimum_age_restriction = 12
    film2.rating = 2.5
    film2.image_url = 'https://image.jpg'
    film2.save
   

    film1.save
    film2.save

    assert film1.valid?
    refute film2.valid?
    
  end
end
