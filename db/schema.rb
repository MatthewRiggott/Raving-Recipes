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

ActiveRecord::Schema.define(version: 20150417200715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "containers", force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "recipe_id", null: false
  end

  add_index "containers", ["user_id", "recipe_id"], name: "index_containers_on_user_id_and_recipe_id", unique: true, using: :btree

  create_table "directions", force: :cascade do |t|
    t.integer  "step_number", null: false
    t.integer  "recipe_id",   null: false
    t.string   "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "directions", ["step_number", "recipe_id"], name: "index_directions_on_step_number_and_recipe_id", unique: true, using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id",                      null: false
    t.integer  "ingredient_id",                  null: false
    t.string   "unit",                           null: false
    t.integer  "numerator_amount",               null: false
    t.integer  "denominator_amount", default: 1, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "category",                 null: false
    t.string   "name",                     null: false
    t.text     "description",              null: false
    t.integer  "prep_time",                null: false
    t.integer  "rating_count", default: 0, null: false
    t.integer  "rating_total", default: 0, null: false
    t.string   "country",                  null: false
    t.string   "image_url",                null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "vote_count",   default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "views", ["user_id", "recipe_id"], name: "index_views_on_user_id_and_recipe_id", unique: true, using: :btree

  add_foreign_key "identities", "users"
end
