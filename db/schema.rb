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

ActiveRecord::Schema[8.0].define(version: 2025_06_29_151958) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "pricePerUnit"
    t.integer "quantity"
    t.integer "expenses"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id", null: false
    t.string "transaction_type"
    t.index ["company_id"], name: "index_transactions_on_company_id"
    t.index ["product_id"], name: "index_transactions_on_product_id"
  end

  add_foreign_key "products", "companies", on_delete: :cascade
  add_foreign_key "transactions", "companies", on_delete: :cascade
  add_foreign_key "transactions", "products"
end
