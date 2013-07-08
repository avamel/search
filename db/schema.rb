# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130702075721) do

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries_tours", id: false, force: true do |t|
    t.integer "country_id", null: false
    t.integer "tour_id",    null: false
  end

  add_index "countries_tours", ["country_id", "tour_id"], name: "index_countries_tours_on_country_id_and_tour_id", using: :btree

  create_table "tourdates", force: true do |t|
    t.date     "startdate"
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours_types", id: false, force: true do |t|
    t.integer "tour_id", null: false
    t.integer "type_id", null: false
  end

  add_index "tours_types", ["tour_id", "type_id"], name: "index_tours_types_on_tour_id_and_type_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
