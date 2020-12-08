require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get venues_url, params: { film: @film.id}
    assert_response :success
  end

  test "Should redirect with no film param" do
    get venues_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "Should redirect with bad film" do
    get venues_url, params: {film: 999}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end


end
