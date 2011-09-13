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

ActiveRecord::Schema.define(:version => 20110823010621) do

  create_table "addresses", :force => true do |t|
    t.integer  "customer_id"
    t.string   "address"
    t.string   "complement"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "cel_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "preferred"
    t.string   "number"
    t.string   "city"
    t.string   "state"
    t.string   "bairro"
  end

  create_table "big_orders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
    t.integer  "customer_id"
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.float    "total"
    t.integer  "quantity"
    t.float    "freight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "super_category_id"
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
    t.integer  "customer_id"
    t.integer  "company_id"
    t.integer  "item_qtd"
    t.float    "total"
    t.integer  "address_id"
    t.string   "status",         :default => "Incompleto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "big_order_id"
    t.string   "ip_address"
    t.string   "payment_status", :default => "Aguardando Pagamento"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.float    "original_price"
    t.float    "price"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.integer  "category_id"
    t.integer  "company_id"
    t.boolean  "shippable"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "type",          :default => "Customer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "document"
    t.string   "telephone"
    t.string   "celphone"
    t.date     "birthdate"
    t.string   "sex"
    t.string   "razao_social"
    t.boolean  "verified"
    t.string   "area"
    t.string   "image"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
  end

end
