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

ActiveRecord::Schema.define(version: 20131110054806) do

  create_table "center_days", force: true do |t|
    t.integer  "center_id"
    t.integer  "school_day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centers", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conf_attendances", force: true do |t|
    t.integer  "conference_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: true do |t|
    t.date     "confdate"
    t.time     "conftime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_days", force: true do |t|
    t.integer  "student_id"
    t.integer  "center_day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.integer  "parent_id"
    t.string   "center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "email"
    t.string   "user_role"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", force: true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
