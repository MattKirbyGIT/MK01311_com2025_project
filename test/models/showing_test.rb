require 'test_helper'

class ShowingTest < ActiveSupport::TestCase
  test 'should not save empty showing' do
    showing = Showing.new
  
    showing.save
    refute showing.valid?
  end
end
