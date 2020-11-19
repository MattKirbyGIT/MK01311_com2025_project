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

ActiveRecord::Schema.define(version: 2020_11_19_174423) do

  create_table "bookings", force: :cascade do |t|
    t.integer "showing_id"
    t.string "name"
    t.string "email"
    t.integer "seat"
    t.integer "row"
    t.string "E_ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["showing_id"], name: "index_bookings_on_showing_id"
  end

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
    t.integer "venue_id", null: false
    t.date "date"
    t.time "time", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_showings_on_film_id"
    t.index ["id"], name: "index_showings_on_id"
    t.index ["venue_id"], name: "index_showings_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "image_url"
    t.integer "rows", null: false
    t.integer "seats_per_row", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
