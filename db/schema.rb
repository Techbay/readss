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

ActiveRecord::Schema.define(version: 20160609050938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_requests", force: :cascade do |t|
    t.string   "address"
    t.string   "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "trans_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.string   "rid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "source_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
    t.index ["tag_id"], name: "index_tags_users_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_tags_users_on_user_id", using: :btree
  end

  create_table "tags_videos", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "video_id"
    t.index ["tag_id"], name: "index_tags_videos_on_tag_id", using: :btree
    t.index ["video_id"], name: "index_tags_videos_on_video_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "reward",                 default: 0
    t.boolean  "isadmin",                default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "users_videos", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.index ["user_id"], name: "index_users_videos_on_user_id", using: :btree
    t.index ["video_id"], name: "index_users_videos_on_video_id", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "published_at"
    t.string   "thumbnail_url"
    t.string   "channel_id"
    t.string   "channel_title"
    t.integer  "category_id"
    t.string   "category_title"
    t.integer  "view_count"
    t.integer  "like_count"
    t.integer  "dislike_count"
    t.integer  "favorite_count"
    t.integer  "comment_count"
    t.integer  "duration"
    t.boolean  "is_hd"
    t.string   "embed_html"
    t.string   "video_id"
    t.string   "video_type"
    t.string   "summary_md"
    t.boolean  "is_pro",         default: false
  end

end
