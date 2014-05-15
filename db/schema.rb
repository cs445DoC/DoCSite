# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140503190644) do

  create_table "fuel_usages", :force => true do |t|
    t.datetime "date"
    t.string   "license_plate"
    t.float    "mileage"
    t.float    "gallons"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "maintenance_records", :force => true do |t|
    t.date     "date"
    t.string   "license_plate"
    t.string   "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "timecards", :force => true do |t|
    t.date   "weekending"
    t.date   "date"
    t.float  "hours_worked"
    t.string "paycode"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "currently_employed", :default => true
    t.boolean  "boss_privileges",    :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "salt"
  end

end
