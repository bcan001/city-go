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

ActiveRecord::Schema.define(version: 2018_05_22_162111) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "zip"
    t.index ["name", "state"], name: "index_cities_on_name_and_state"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "event_date"
    t.string "title"
    t.text "description"
    t.integer "city_id"
    t.integer "venue_id"
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_events_on_artist_id"
    t.index ["event_date", "city_id"], name: "index_events_on_event_date_and_city_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "links", force: :cascade do |t|
    t.integer "artist_id"
    t.string "link_type"
    t.integer "link_id"
    t.index ["artist_id", "link_type"], name: "index_links_on_artist_id_and_link_type"
    t.index ["link_type", "link_id"], name: "index_links_on_link_type_and_link_id"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.string "favorite_type"
    t.integer "favorite_id"
    t.index ["favorite_type", "favorite_id"], name: "index_user_favorites_on_favorite_type_and_favorite_id"
    t.index ["user_id", "favorite_type"], name: "index_user_favorites_on_user_id_and_favorite_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "city_id"
    t.index ["city_id"], name: "index_venues_on_city_id"
    t.index ["name"], name: "index_venues_on_name"
  end

  create_table "votes", force: :cascade do |t|
    t.string "vote_type"
    t.integer "vote_id"
    t.integer "user_id"
    t.index ["user_id", "vote_type"], name: "index_votes_on_user_id_and_vote_type"
    t.index ["vote_type", "vote_id"], name: "index_votes_on_vote_type_and_vote_id"
  end

end
