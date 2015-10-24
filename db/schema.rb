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

ActiveRecord::Schema.define(version: 20151023145553) do

  create_table "children", force: true do |t|
    t.string   "code"
    t.integer  "family_id",         limit: 4
    t.string   "notes",             limit: 2147483647
    t.string   "given_name1"
    t.string   "given_name2"
    t.string   "family_name1"
    t.string   "family_name2"
    t.string   "preferred_name"
    t.date     "dob",               limit: 10
    t.string   "status"
    t.string   "gender"
    t.datetime "created_at",        limit: 23
    t.datetime "updated_at",        limit: 23
    t.string   "derived_community"
    t.integer  "derived_number",    limit: 4
  end

  create_table "communities", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", limit: 23
    t.datetime "updated_at", limit: 23
  end

  create_table "enrollments", force: true do |t|
    t.string   "school_year"
    t.integer  "child_id",                 limit: 4
    t.string   "child_code"
    t.integer  "sponsor_id",               limit: 4
    t.string   "sponsor_code"
    t.string   "newyear_shirt_size"
    t.string   "newyear_pant_size"
    t.string   "newyear_shoe_size"
    t.string   "midyear_shirt_size"
    t.string   "midyear_pant_size"
    t.string   "midyear_shoe_size"
    t.integer  "newyear_attendance_id",    limit: 4
    t.string   "newyear_attendance_notes", limit: 2147483647
    t.integer  "midyear_attendance_id",    limit: 4
    t.string   "midyear_attendance_notes", limit: 2147483647
    t.boolean  "report_card"
    t.string   "report_notes",             limit: 2147483647
    t.boolean  "work_form"
    t.string   "work_form_notes",          limit: 2147483647
    t.boolean  "pass"
    t.string   "pass_notes",               limit: 2147483647
    t.string   "grades"
    t.string   "grades_notes",             limit: 2147483647
    t.boolean  "letter"
    t.boolean  "not_included"
    t.datetime "created_at",               limit: 23
    t.datetime "updated_at",               limit: 23
  end

  create_table "families", force: true do |t|
    t.integer  "community_id",   limit: 4
    t.string   "community_code"
    t.string   "notes",          limit: 2147483647
    t.datetime "created_at",     limit: 23
    t.datetime "updated_at",     limit: 23
    t.string   "name"
  end

  create_table "guardians", force: true do |t|
    t.integer  "family_id",       limit: 4
    t.string   "relationship"
    t.integer  "relationship_id", limit: 4
    t.boolean  "active"
    t.boolean  "primary"
    t.string   "given_name1"
    t.string   "given_name2"
    t.string   "family_name1"
    t.string   "family_name2"
    t.string   "preferred_name"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.datetime "created_at",      limit: 23
    t.datetime "updated_at",      limit: 23
  end

  create_table "sponsors", force: true do |t|
    t.string   "code"
    t.string   "donor_number"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "link"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.datetime "created_at",      limit: 23
    t.datetime "updated_at",      limit: 23
  end

  create_table "sponsorships", force: true do |t|
    t.string   "school_year"
    t.integer  "sponsor_id",      limit: 4
    t.string   "sponsor_code"
    t.integer  "number_children", limit: 4
    t.integer  "dollar_amount",   limit: 4
    t.datetime "created_at",      limit: 23
    t.datetime "updated_at",      limit: 23
  end

end
