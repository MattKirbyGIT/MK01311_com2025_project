require 'test_helper'

class ShowingTest < ActiveSupport::TestCase
  test 'should not save empty showing' do
    showing = Showing.new
  
    showing.save
    refute showing.valid?
  end

  test 'should save valid showing' do
    showing = Showing.new
    
    showing.film = films(:one);
    showing.venue = venues(:one);

    showing.time = "11:00:28"
    showing.date = 2020-11-18
    showing.price = 9.90
    showing.save

    assert showing.valid?
    assert_match showing.film.title, "MyString 1"
    assert_match showing.venue.name, "MyString"
  end


end
