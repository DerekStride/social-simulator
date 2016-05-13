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

ActiveRecord::Schema.define(version: 20160501235206) do

  create_table "contents", force: :cascade do |t|
    t.string   "name"
    t.integer  "producer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contents_social_users", id: false, force: :cascade do |t|
    t.integer "social_user_id", null: false
    t.integer "content_id",     null: false
  end

  add_index "contents_social_users", ["content_id", "social_user_id"], name: "index_contents_social_users_on_content_id_and_social_user_id"
  add_index "contents_social_users", ["social_user_id", "content_id"], name: "index_contents_social_users_on_social_user_id_and_content_id"

  create_table "follower_following", id: false, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
  end

  add_index "follower_following", ["follower_id", "following_id"], name: "index_follower_following_on_follower_id_and_following_id", unique: true
  add_index "follower_following", ["following_id", "follower_id"], name: "index_follower_following_on_following_id_and_follower_id", unique: true

  create_table "social_users", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.string   "social_strategy"
    t.string   "search_strategy"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "taggings", id: false, force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "taggings", ["tag_id", "tagable_id"], name: "index_taggings_on_tag_id_and_tagable_id"
  add_index "taggings", ["tagable_id", "tag_id"], name: "index_taggings_on_tagable_id_and_tag_id"
  add_index "taggings", ["tagable_type", "tagable_id"], name: "index_taggings_on_tagable_type_and_tagable_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
