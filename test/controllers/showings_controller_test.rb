require 'test_helper'

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showing = showings(:one)
    @film = films(:one)
    @venue = venues(:one)
  end

  test "should get index" do
    get showings_url, params: { film: @film.id}
    assert_response :success
  end
end
