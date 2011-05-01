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

ActiveRecord::Schema.define(:version => 20110501095349) do

  create_table "reservations", :force => true do |t|
    t.date     "data_poczatkowa"
    t.date     "data_koncowa"
    t.integer  "id_klienta"
    t.integer  "id_pokoju"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "typ"
    t.float    "cena"
    t.boolean  "lazienka"
    t.boolean  "aneks_kuchenny"
    t.boolean  "minibarek"
    t.boolean  "sejf"
    t.boolean  "telewizor"
    t.boolean  "telefon"
    t.boolean  "radio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "house"
    t.string   "city"
    t.string   "zip_code"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
