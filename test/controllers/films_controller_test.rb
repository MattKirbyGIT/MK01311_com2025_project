require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get films_url
    assert_response :success
  end


  test "should create film" do
    assert_difference('Film.count') do
      post films_url, params: { film: { description: @film.description, image_url: @film.image_url, minimum_age_restriction: @film.minimum_age_restriction, rating: @film.rating, release_date: @film.release_date, running_time_mins: @film.running_time_mins, title: @film.title + " create" } }
    end

    assert_redirected_to film_url(Film.last)
  end


  test "should update film" do
    patch film_url(@film), params: { film: { description: @film.description, image_url: @film.image_url, minimum_age_restriction: @film.minimum_age_restriction, rating: @film.rating, release_date: @film.release_date, running_time_mins: @film.running_time_mins, title: @film.title } }
    assert_redirected_to film_url(@film)
  end

  test "should destroy film" do
    assert_difference('Film.count', -1) do
      delete film_url(@film)
    end

    assert_redirected_to films_url
  end
end
