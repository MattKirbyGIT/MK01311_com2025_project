require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  # Should show the film index page.
  test "should get index" do
    get films_url
    assert_response :success
  end

  # Should get the number of films in a grid by couunting the number of elements with a 'grid-cell' class
  test "should get number of films in grid" do
    get films_url
    assert_select 'div.grid-cell',2
   end

   # Should show a film by its index. 
   test "should show film" do
    get film_url(@film)
    assert_response :success
    assert_select 'h1', 'MyString 1'
  end

  # If an invalid film is provided in the get request, redirect with an error message.
  test "Redirect on unknown film!" do
    get film_url(999)
    assert_response :redirect
      assert_not_empty flash[:alert]
      assert_nil flash[:notice]
    end
end
