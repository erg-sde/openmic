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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20171009231516) do
=======
ActiveRecord::Schema.define(version: 20171010012315) do
>>>>>>> 8dac824f8692136d5515b2acaf1493bd4d2cb195

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "start"
    t.string "end"
    t.string "photos"
    t.string "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.string "arrival"
    t.string "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "google_id"
    t.string "facebook_id"
    t.float "latitude"
    t.float "longitude"
    t.index [nil], name: "index_users_on_network_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "location"
    t.string "photos"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_digest"
    t.float "latitude"
    t.float "longitude"
  end

end
