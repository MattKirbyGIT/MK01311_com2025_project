require 'test_helper'

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showing = showings(:one)
    @film = films(:one)
  end

  test "should get index" do
    get showings_url
    assert_response :success
  end

  test "should get new" do
    get new_showing_url
    assert_response :success
  end

  test "should create showing" do
    assert_difference('Showing.count') do
      post showings_url, params: { showing: { date: @showing.date, film_id: @film.id, rows: @showing.rows, seats_per_row: @showing.seats_per_row, time: @showing.time, venue: @showing.venue + " create" } }
    end

    assert_redirected_to showing_url(Showing.last)
  end

  test "should show showing" do
    get showing_url(@showing)
    assert_response :success
  end

  test "should get edit" do
    get edit_showing_url(@showing)
    assert_response :success
  end

  test "should update showing" do
    patch showing_url(@showing), params: { showing: { date: @showing.date, film_id: @film.id, rows: @showing.rows, seats_per_row: @showing.seats_per_row, time: @showing.time, venue: @showing.venue } }
    assert_redirected_to showing_url(@showing)
  end

  test "should destroy showing" do
    assert_difference('Showing.count', -1) do
      delete showing_url(@showing)
    end

    assert_redirected_to showings_url
  end
end
