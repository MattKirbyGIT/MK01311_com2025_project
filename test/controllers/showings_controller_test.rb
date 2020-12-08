require 'test_helper'

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showing = showings(:one)
    @film = films(:one)
    @venue = venues(:one)
  end

  test "should get index" do
    get showings_url, params: { film: @film.id, venue: @venue.id }
    assert_response :success
  end

  test "cant show index with no parameter" do
    get showings_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "Can't show showings for unknown film" do
    get showings_url, params: {film: 999, venue: @venue.id}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "Can't show showings for unknown venue" do
    get showings_url, params: {film: @film.id, venue: 999}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "can't show showings without film" do
    get showings_url, params: {venue: @venue.id}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "can't show showings without venue" do
    get showings_url, params: {film: @film.id}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end



end
