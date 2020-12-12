require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @film = films(:one)
  end

  # should get index if parameter is correctly provided.
  test "should get index" do
    get venues_url, params: { film: @film.id}
    assert_response :success
  end

  # Should redirect with error message if no film parameter is given
  test "Should redirect with no film param" do
    get venues_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  # Should redirect if film parameter is invalid
  test "Should redirect with bad film" do
    get venues_url, params: {film: 999}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end


end
