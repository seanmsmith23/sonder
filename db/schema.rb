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

ActiveRecord::Schema.define(version: 20141028204613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: true do |t|
    t.integer  "memorial_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer "memorial_id"
    t.integer "user_id"
    t.string  "image"
    t.text    "subtitle"
    t.boolean "background",  default: false
  end

  create_table "likes", force: true do |t|
    t.integer "likeable_id"
    t.string  "likeable_type"
    t.integer "user_id"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "memorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "permission",  default: true
  end

  create_table "memorials", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "born"
    t.date     "died"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "memorial_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
  end

  create_table "stories", force: true do |t|
    t.integer  "user_id"
    t.integer  "memorial_id"
    t.text     "story"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
