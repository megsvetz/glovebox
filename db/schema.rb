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

ActiveRecord::Schema.define(version: 20150714233640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insurances", force: :cascade do |t|
    t.string   "policy_number"
    t.string   "company"
    t.integer  "cost"
    t.integer  "vehicle_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "expiration_date"
    t.date     "renewal_date"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "state"
    t.date     "expiration"
    t.integer  "cost"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "vehicle_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.string   "type"
    t.text     "repair_description"
    t.date     "repair_date"
    t.decimal  "repair_cost",               precision: 6, scale: 2
    t.string   "repair_image_file_name"
    t.string   "repair_image_content_type"
    t.integer  "repair_image_file_size"
    t.datetime "repair_image_updated_at"
    t.string   "repair_place"
    t.integer  "vehicle_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "city"
    t.string   "state"
    t.string   "zip_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "type",               default: "car"
    t.string   "make",               default: "make"
    t.string   "model",              default: "model"
    t.integer  "year"
    t.integer  "mileage"
    t.string   "name",               default: "vehicle"
    t.string   "vin"
    t.string   "license_plate"
    t.string   "state"
    t.integer  "user_id"
    t.boolean  "selling",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
