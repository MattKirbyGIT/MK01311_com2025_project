require 'test_helper'

class MyBookingsControllerTest < ActionDispatch::IntegrationTest

  test 'should get mybookings' do
    get mybookings_url
    assert_response :success

    assert_select 'h1','Search bookings'
    assert_select 'p', 'Enter your E-ticket code in the field below to find your booking infomation.'
  end

  test 'should show notice' do
    get '/mybookings/find'
    assert_redirected_to mybookings_url

    assert_not_empty flash[:alert]

    get mybookings_url
    assert_select 'div','E-ticket not found!'
  end

  test 'should get find' do
    get '/mybookings/find', params: { E_ticket: "MyString"}
    assert_response :success
    assert_select 'h1','My bookings'
    assert_select 'li', "MyString 2"
  end

  test 'should show notice for no params' do
    get '/mybookings/find?E_ticket: aaaaa'
    assert_redirected_to mybookings_url

    assert_not_empty flash[:alert]

    get mybookings_url
    assert_select 'div','E-ticket not found!'
  end



end
