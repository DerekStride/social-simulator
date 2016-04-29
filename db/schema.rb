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

ActiveRecord::Schema.define(version: 20160429020825) do

  create_table "follower_following", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
  end

  add_index "follower_following", ["follower_id", "following_id"], name: "index_follower_following_on_follower_id_and_following_id", unique: true
  add_index "follower_following", ["following_id", "follower_id"], name: "index_follower_following_on_following_id_and_follower_id", unique: true

  create_table "social_users", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_users_tags", id: false, force: :cascade do |t|
    t.integer "social_user_id", null: false
    t.integer "tag_id",         null: false
  end

  add_index "social_users_tags", ["social_user_id", "tag_id"], name: "index_social_users_tags_on_social_user_id_and_tag_id"
  add_index "social_users_tags", ["tag_id", "social_user_id"], name: "index_social_users_tags_on_tag_id_and_social_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
