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

  test "should show showings" do
    get showings_url, params: { film: @film.id}
    assert_select 'div.grid-cell',1
  end

  test "cant show index with no parameter" do
    get showings_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "Can't show showings for unknown film" do
    get showings_url, params: {film: 999}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

end
