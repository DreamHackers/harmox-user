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

ActiveRecord::Schema.define(version: 20150904144727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bot_hash_tag_rels", force: :cascade do |t|
    t.integer  "bot_id"
    t.integer  "hash_tag_id"
    t.boolean  "deleted",     default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "bots", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.string   "twitter_name"
    t.string   "twitter_id",                    null: false
    t.string   "access_token"
    t.string   "access_secret"
    t.boolean  "deleted",       default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "hash_tags", force: :cascade do |t|
    t.string   "hash_tag",                   null: false
    t.boolean  "deleted",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "realtime_bot_hash_tag_trackings", force: :cascade do |t|
    t.integer  "bot_id",                     null: false
    t.integer  "bot_type"
    t.text     "content"
    t.boolean  "deleted",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "bot_id",     null: false
    t.time     "time",       null: false
    t.integer  "weekday",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["bot_id"], name: "by_bot_id", unique: true, using: :btree
  add_index "schedules", ["user_id"], name: "by_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
