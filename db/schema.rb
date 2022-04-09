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

ActiveRecord::Schema[7.0].define(version: 2022_04_09_135348) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consume_histories", force: :cascade do |t|
    t.bigint "inventory_id"
    t.date "consume_on"
    t.decimal "quantity", precision: 32, scale: 6
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["inventory_id"], name: "idx_16549_index_consume_histories_on_inventory_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.decimal "quantity", precision: 32, scale: 6
    t.bigint "unit_id"
    t.date "in_stock_on"
    t.date "produced_on"
    t.bigint "shelf_life"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.decimal "price", precision: 10, scale: 2
    t.bigint "storage_id", default: 1
    t.bigint "shelf_life_unit"
    t.bigint "product_id"
    t.date "expire_on"
    t.boolean "is_in_stock", default: true, null: false
    t.index ["expire_on"], name: "index_inventories_on_expire_on"
    t.index ["in_stock_on", "produced_on"], name: "idx_16553_index_inventories_on_in_stock_on_and_produced_on"
    t.index ["is_in_stock"], name: "index_inventories_on_is_in_stock"
    t.index ["product_id"], name: "idx_16553_index_inventories_on_product_id"
    t.index ["storage_id"], name: "idx_16553_index_inventories_on_storage_id"
    t.index ["unit_id"], name: "idx_16553_index_inventories_on_unit_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "name"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "item_id"
    t.text "variant"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["item_id"], name: "idx_16540_index_products_on_item_id"
  end

  create_table "storages", force: :cascade do |t|
    t.text "location"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "units", force: :cascade do |t|
    t.text "name"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  add_foreign_key "consume_histories", "inventories", name: "consume_histories_inventory_id_fkey"
  add_foreign_key "inventories", "products", name: "inventories_product_id_fkey"
  add_foreign_key "inventories", "storages", name: "inventories_storage_id_fkey"
  add_foreign_key "inventories", "units", name: "inventories_unit_id_fkey"
  add_foreign_key "products", "items", name: "products_item_id_fkey"
end
