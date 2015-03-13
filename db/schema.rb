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

ActiveRecord::Schema.define(version: 20150313071449) do

  create_table "category_selects", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "menu_id"
    t.integer  "category_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category"
    t.integer  "category_number2"
    t.integer  "category_number3"
    t.integer  "category_number4"
    t.integer  "category_number5"
  end

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_menus", force: true do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["user_id", "recipe_id"], name: "index_favorites_on_user_id_and_recipe_id", unique: true

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "recipe_id"
    t.string   "volume"
    t.integer  "order_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "made_reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.string   "image"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "menu_recipes", force: true do |t|
    t.integer  "menu_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "select_flag"
  end

  add_index "menu_recipes", ["recipe_id", "menu_id"], name: "index_menu_recipes_on_recipe_id_and_menu_id", unique: true

  create_table "menus", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "point"
    t.string   "image"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "procedures", force: true do |t|
    t.integer  "recipe_id"
    t.string   "body"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tip"
    t.integer  "calorie"
    t.string   "image"
    t.integer  "recipe_select"
    t.integer  "favorite_number"
    t.integer  "kind"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category"
  end

  create_table "users", force: true do |t|
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "image"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid",                    default: "", null: false
    t.string   "provider",               default: "", null: false
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider"

end
