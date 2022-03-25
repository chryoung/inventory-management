# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_25_084134) do
  create_table "inventories", force: :cascade do |t|
    t.integer "item_id", null: false
    t.decimal "quantity", precision: 32, scale: 6
    t.integer "unit_id", null: false
    t.datetime "in_stock_on"
    t.datetime "produced_on"
    t.integer "shelf_life"
    t.datetime "expire_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 10, scale: 2
    t.integer "storage_id", default: 1, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["storage_id"], name: "index_inventories_on_storage_id"
    t.index ["unit_id"], name: "index_inventories_on_unit_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventories", "items"
  add_foreign_key "inventories", "storages"
  add_foreign_key "inventories", "units"
end
