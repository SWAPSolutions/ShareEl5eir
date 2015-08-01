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

ActiveRecord::Schema.define(version: 20150730233542) do

  create_table "cloths", force: :cascade do |t|
    t.string   "size"
    t.string   "color"
    t.integer  "user_id"
    t.integer  "quantity"
    t.text     "description"
    t.boolean  "donated"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.date     "exp_date"
    t.string   "concentration"
    t.integer  "quantity"
    t.text     "description"
    t.boolean  "donated"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.text     "photo"
    t.integer  "device_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.integer  "role"
    t.text     "bio"
    t.string   "phone"
    t.text     "address"
    t.text     "photo"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
