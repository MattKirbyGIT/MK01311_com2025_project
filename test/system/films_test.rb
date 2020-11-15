require "application_system_test_case"

class FilmsTest < ApplicationSystemTestCase
  setup do
    @film = films(:one)
  end

  test "visiting the index" do
    visit films_url
    assert_selector "h1", text: "Films"
  end

  test "creating a Film" do
    visit films_url
    click_on "New Film"

    fill_in "Description", with: @film.description
    fill_in "Image url", with: @film.image_url
    fill_in "Minimum age restriction", with: @film.minimum_age_restriction
    fill_in "Rating", with: @film.rating
    fill_in "Release date", with: @film.release_date
    fill_in "Running time mins", with: @film.running_time_mins
    fill_in "Title", with: @film.title
    click_on "Create Film"

    assert_text "Film was successfully created"
    click_on "Back"
  end

  test "updating a Film" do
    visit films_url
    click_on "Edit", match: :first

    fill_in "Description", with: @film.description
    fill_in "Image url", with: @film.image_url
    fill_in "Minimum age restriction", with: @film.minimum_age_restriction
    fill_in "Rating", with: @film.rating
    fill_in "Release date", with: @film.release_date
    fill_in "Running time mins", with: @film.running_time_mins
    fill_in "Title", with: @film.title
    click_on "Update Film"

    assert_text "Film was successfully updated"
    click_on "Back"
  end

  test "destroying a Film" do
    visit films_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Film was successfully destroyed"
  end
end
