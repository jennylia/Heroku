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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140308200431) do

  create_table "clinics", force: true do |t|
    t.string   "SV_TAXONOMY"
    t.string   "TAXONOMY_NAME"
    t.string   "RG_REFERENCE"
    t.string   "RG_NAME"
    t.string   "SV_REFERENCE"
    t.string   "SV_NAME"
    t.string   "SV_DESCRIPTION"
    t.string   "SL_REFERENCE"
    t.string   "LC_REFERENCE"
    t.string   "PHONE_NUMBER"
    t.string   "WEBSITE"
    t.string   "EMAIL_ADDRESS"
    t.string   "WHEELCHAIR_ACCESSIBLE"
    t.string   "LANGUAGE"
    t.text     "HOURS"
    t.string   "STREET_NUMBER"
    t.string   "STREET_NAME"
    t.string   "STREET_TYPE"
    t.string   "STREET_DIRECTION"
    t.string   "CITY"
    t.string   "PROVINCE"
    t.string   "POSTAL_CODE"
    t.float    "LATITUDE"
    t.float    "LONGITUDE"
    t.string   "811_LINK"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
