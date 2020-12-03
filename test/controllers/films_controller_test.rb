require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get films_url
    assert_response :success
  end

  test "should get number of films in grid" do
    get films_url
    assert_select 'div.grid-cell',2
   end

   test "should show film" do
    get film_url(@film)
    
    assert_response :success
    assert_select 'h1', 'MyString 1'
  end

  test "Redirect on unknown film!" do

  get film_url(999)
  assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end


end
