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

ActiveRecord::Schema.define(version: 20150901110504) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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
    t.integer  "category_number6"
  end

  create_table "columns", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nutritionist_id"
    t.string   "body"
    t.string   "title"
    t.integer  "permission"
    t.integer  "user_id"
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

  add_index "favorites", ["user_id", "recipe_id"], name: "index_favorites_on_user_id_and_recipe_id", unique: true, using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_infos", force: true do |t|
    t.integer  "item_no"
    t.string   "name"
    t.float    "disposal_rate"
    t.float    "energy"
    t.float    "energy_juel"
    t.float    "water"
    t.float    "protein"
    t.float    "protein_with_amino"
    t.float    "fat"
    t.float    "triacylglycerol"
    t.float    "carbohydrate"
    t.float    "ash"
    t.float    "na"
    t.float    "k"
    t.float    "ca"
    t.float    "mg"
    t.float    "p"
    t.float    "fe"
    t.float    "zn"
    t.float    "cu"
    t.float    "mn"
    t.float    "i"
    t.float    "se"
    t.float    "cr"
    t.float    "mo"
    t.float    "retinol"
    t.float    "alpha_carotene"
    t.float    "beta_carotene"
    t.float    "beta_cryptoxanthin"
    t.float    "beta_carotene_equivalents"
    t.float    "retinol_equivalents"
    t.float    "vitamin_d"
    t.float    "alpha_tocopherol"
    t.float    "beta_tocopherol"
    t.float    "gammma_tocopherol"
    t.float    "delta_tocopherol"
    t.float    "vitamin_k"
    t.float    "vitamin_b1"
    t.float    "vitamin_b2"
    t.float    "niacin"
    t.float    "vitamin_b6"
    t.float    "vitamin_b12"
    t.float    "folic_acid"
    t.float    "pantothenic_acid"
    t.float    "biotin"
    t.float    "vitamin_c"
    t.float    "saturated_fatty_acid"
    t.float    "monounsaturated_fatty_acid"
    t.float    "polyunsaturated_fatty_acid"
    t.float    "cholesterol"
    t.float    "soluble_dietary_fiber"
    t.float    "insoluble_dietary_fiber"
    t.float    "dietary_fiber"
    t.float    "salt_equivalents"
    t.float    "weight_change_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "use_flag"
    t.string   "unit"
    t.float    "weight"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "recipe_id"
    t.string   "volume"
    t.integer  "order"
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

  add_index "menu_recipes", ["recipe_id", "menu_id"], name: "index_menu_recipes_on_recipe_id_and_menu_id", unique: true, using: :btree

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

  create_table "nutritionists", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
    t.integer  "permission"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "nutritionists", ["email"], name: "index_nutritionists_on_email", unique: true, using: :btree
  add_index "nutritionists", ["reset_password_token"], name: "index_nutritionists_on_reset_password_token", unique: true, using: :btree

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
    t.integer  "order"
  end

  create_table "recipe_feelings", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "feeling"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "people"
    t.integer  "pre_save"
    t.integer  "sugar"
  end

  create_table "users", force: true do |t|
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "image"
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid",                      default: "", null: false
    t.string   "provider",                 default: "", null: false
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "password_digest"
    t.string   "nutritionist_description"
    t.string   "permission"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "active_level"
    t.integer  "calorie_setting"
    t.integer  "birth_year"
    t.integer  "birth_month"
    t.integer  "birth_day"
    t.integer  "self_setting_calorie"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree

end
