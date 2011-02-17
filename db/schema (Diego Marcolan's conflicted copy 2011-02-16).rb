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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110216205722) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.string   "complement"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "cel_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "preferred"
    t.integer  "customer_id"
  end

  create_table "big_orders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "product_id",  :null => false
    t.integer "category_id", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",   :default => 1
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
  end

  create_table "orders", :force => true do |t|
    t.float    "total"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "company_id"
    t.integer  "big_order_id"
    t.string   "ip_address"
    t.integer  "shipping_address_id"
    t.string   "payment_status",      :default => "Aguardando Pagamento"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.integer  "category_id"
    t.integer  "company_id"
    t.boolean  "shippable"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "original_price"
    t.float    "price"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "name"
    t.string   "document"
    t.string   "telephone"
    t.string   "celphone"
    t.date     "birthdate"
    t.string   "sex"
    t.string   "razao_social"
    t.boolean  "verified"
    t.string   "area"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
