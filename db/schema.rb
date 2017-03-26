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

ActiveRecord::Schema.define(version: 20170326162146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_admin_categories_on_name", using: :btree
  end

  create_table "admin_companies", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_admin_companies_on_name", using: :btree
  end

  create_table "admin_products", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.text     "description"
    t.integer  "category_id",                            null: false
    t.integer  "subcategory_id",                         null: false
    t.integer  "company_id",                             null: false
    t.string   "image_url"
    t.decimal  "price",          precision: 8, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["name"], name: "index_admin_products_on_name", using: :btree
  end

  create_table "admin_sub_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_admin_sub_categories_on_name", using: :btree
  end

  create_table "expiry_dates", force: :cascade do |t|
    t.integer  "product_id",  null: false
    t.integer  "part_number"
    t.integer  "count",       null: false
    t.datetime "date_added"
    t.datetime "date_expiry", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_expiry_dates_on_product_id", using: :btree
  end

end
