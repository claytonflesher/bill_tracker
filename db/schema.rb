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

ActiveRecord::Schema.define(version: 20150906022858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bill_subscriptions", ["bill_id"], name: "index_bill_subscriptions_on_bill_id", using: :btree
  add_index "bill_subscriptions", ["user_id"], name: "index_bill_subscriptions_on_user_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                null: false
    t.string   "password_digest",      null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "verification_token"
    t.datetime "verified_at"
    t.string   "password_reset_token"
    t.integer  "house_district"
    t.integer  "senate_district"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "bill_subscriptions", "bills"
  add_foreign_key "bill_subscriptions", "users"
end
