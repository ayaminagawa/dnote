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

ActiveRecord::Schema.define(version: 20150211210702) do

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

  create_table "favorite_recipes", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  create_table "menu_recipes", force: true do |t|
    t.integer  "menu_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "point"
    t.string   "image"
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
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "sns_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image"
    t.integer  "recipe_select"
    t.integer  "favorite_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
