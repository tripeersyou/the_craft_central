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

ActiveRecord::Schema.define(version: 20180212125601) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "beginning_inventory_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "ending_inventory_id"
    t.decimal "price", precision: 2, null: false
    t.integer "cost", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ending_inventory_id"], name: "index_beginning_inventory_products_on_ending_inventory_id"
    t.index ["product_id"], name: "index_beginning_inventory_products_on_product_id"
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.integer "total_items", null: false
    t.decimal "total_cost", precision: 2, null: false
    t.decimal "total_price", precision: 2, null: false
    t.text "description", null: false
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_deliveries_on_store_id"
  end

  create_table "delivery_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "delivery_id"
    t.bigint "product_id"
    t.integer "quantity", null: false
    t.decimal "price", precision: 2, null: false
    t.decimal "cost", precision: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_delivery_products_on_delivery_id"
    t.index ["product_id"], name: "index_delivery_products_on_product_id"
  end

  create_table "ending_inventories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.decimal "sales", precision: 2
    t.decimal "cogs", precision: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_ending_inventories_on_store_id"
  end

  create_table "ending_inventory_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "ending_inventory_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ending_inventory_id"], name: "index_ending_inventory_products_on_ending_inventory_id"
    t.index ["product_id"], name: "index_ending_inventory_products_on_product_id"
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "supplier_id"
    t.integer "total_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_orders_on_supplier_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "sku", null: false
    t.string "name", null: false
    t.bigint "brand_id"
    t.text "description"
    t.integer "limit", null: false
    t.decimal "price", precision: 2, null: false
    t.decimal "cost", precision: 2, null: false
    t.integer "inventory", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  create_table "pullout_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pullout_id"
    t.bigint "product_id"
    t.integer "quantity", null: false
    t.decimal "price", precision: 2, null: false
    t.decimal "cost", precision: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pullout_products_on_product_id"
    t.index ["pullout_id"], name: "index_pullout_products_on_pullout_id"
  end

  create_table "pullouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.integer "total_items", null: false
    t.decimal "total_cost", precision: 2, null: false
    t.decimal "total_price", precision: 2, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_pullouts_on_store_id"
  end

  create_table "staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "store_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_id"
    t.bigint "product_id"
    t.integer "inventory", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "address"
    t.string "email"
    t.string "contact_person", default: ""
    t.string "contact_number", limit: 11
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "supplier_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_supplier_products_on_product_id"
    t.index ["supplier_id"], name: "index_supplier_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "address"
    t.string "contact_person"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "transfer_id"
    t.bigint "product_id"
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_transfer_products_on_product_id"
    t.index ["transfer_id"], name: "index_transfer_products_on_transfer_id"
  end

  create_table "transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "store_to_id"
    t.bigint "store_from_id"
    t.bigint "pullout_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_id"], name: "index_transfers_on_delivery_id"
    t.index ["pullout_id"], name: "index_transfers_on_pullout_id"
    t.index ["store_from_id"], name: "index_transfers_on_store_from_id"
    t.index ["store_to_id"], name: "index_transfers_on_store_to_id"
  end

  add_foreign_key "beginning_inventory_products", "ending_inventories"
  add_foreign_key "beginning_inventory_products", "products"
  add_foreign_key "deliveries", "stores"
  add_foreign_key "delivery_products", "deliveries"
  add_foreign_key "delivery_products", "products"
  add_foreign_key "ending_inventories", "stores"
  add_foreign_key "ending_inventory_products", "ending_inventories"
  add_foreign_key "ending_inventory_products", "products"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "products", "brands"
  add_foreign_key "pullout_products", "products"
  add_foreign_key "pullout_products", "pullouts"
  add_foreign_key "pullouts", "stores"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "supplier_products", "products"
  add_foreign_key "supplier_products", "suppliers"
  add_foreign_key "transfer_products", "products"
  add_foreign_key "transfer_products", "transfers"
  add_foreign_key "transfers", "deliveries"
  add_foreign_key "transfers", "pullouts"
  add_foreign_key "transfers", "stores", column: "store_from_id"
  add_foreign_key "transfers", "stores", column: "store_to_id"
end
