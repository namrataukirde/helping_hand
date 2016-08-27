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

ActiveRecord::Schema.define(version: 20160827104751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pincode"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_id", "resource_type"], name: "index_addresses_on_resource_id_and_resource_type", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "donor_id"
    t.string   "state"
    t.integer  "type"
    t.integer  "quantity"
    t.string   "description"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ngos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "type"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.boolean  "gender"
    t.integer  "qualification"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
