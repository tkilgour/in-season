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

ActiveRecord::Schema.define(version: 20170303145359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.integer "farm_id"
    t.string  "size"
    t.integer "pickup_price_cents"
    t.integer "delivery_price_cents"
    t.text    "description"
    t.index ["farm_id"], name: "index_boxes_on_farm_id", using: :btree
  end

  create_table "crops", force: :cascade do |t|
    t.integer  "farm_id"
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.date     "harvest_date"
    t.boolean  "availability"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "default_image"
  end

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.string   "farmer"
    t.string   "profile_image"
    t.string   "banner_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.text     "about_farm"
    t.boolean  "csa_availability"
  end

  create_table "farms_markets", id: false, force: :cascade do |t|
    t.integer "farm_id",   null: false
    t.integer "market_id", null: false
    t.index ["farm_id", "market_id"], name: "index_farms_markets_on_farm_id_and_market_id", using: :btree
    t.index ["market_id", "farm_id"], name: "index_farms_markets_on_market_id_and_farm_id", using: :btree
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "address"
    t.string   "parsed_address"
    t.string   "market_day"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "box_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "item_price_cents"
    t.integer "total_price_cents"
    t.index ["box_id"], name: "index_order_items_on_box_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer "farm_id"
    t.integer "user_id"
    t.integer "total_price_cents"
    t.string  "shipping_address"
    t.string  "stripe_charge_id"
    t.string  "status"
    t.index ["farm_id"], name: "index_orders_on_farm_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "stock_crops", force: :cascade do |t|
    t.string   "name"
    t.string   "en_wikipedia_url"
    t.integer  "growstuff_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "farm_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "is_farmer"
  end

end
