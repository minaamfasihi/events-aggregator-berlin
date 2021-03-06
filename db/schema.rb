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

ActiveRecord::Schema.define(version: 2018_10_28_093712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "title"
    t.text "details"
    t.date "event_start_date"
    t.bigint "web_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "event_end_date"
    t.text "event_url"
    t.text "img_url"
    t.string "category"
    t.string "subtitle"
    t.index ["event_end_date"], name: "index_events_on_event_end_date"
    t.index ["event_start_date"], name: "index_events_on_event_start_date"
    t.index ["web_source_id"], name: "index_events_on_web_source_id"
  end

  create_table "web_sources", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "base_url"
  end

  add_foreign_key "events", "web_sources"
end
