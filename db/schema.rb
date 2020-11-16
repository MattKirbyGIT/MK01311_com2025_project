# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_16_012801) do

  create_table "films", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.date "release_date", null: false
    t.integer "running_time_mins", null: false
    t.integer "minimum_age_restriction", null: false
    t.string "image_url", null: false
    t.decimal "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_films_on_title", unique: true
  end

  create_table "showings", force: :cascade do |t|
    t.integer "film_id", null: false
    t.date "date", null: false
    t.time "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_showings_on_film_id"
  end

  create_table "showings_venues", id: false, force: :cascade do |t|
    t.integer "showing_id"
    t.integer "venue_id"
    t.index ["showing_id"], name: "index_showings_venues_on_showing_id"
    t.index ["venue_id"], name: "index_showings_venues_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "rows"
    t.integer "seats_per_row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
