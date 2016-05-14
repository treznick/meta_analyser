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

ActiveRecord::Schema.define(version: 20160514164838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meta_analyses", force: :cascade do |t|
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "authors",    null: false
    t.integer  "year",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "description",    null: false
    t.float    "effect_size",    null: false
    t.float    "standard_error", null: false
    t.integer  "study_id",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "treatments", ["study_id"], name: "index_treatments_on_study_id", using: :btree

  add_foreign_key "treatments", "studies"
end
