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

ActiveRecord::Schema.define(version: 20170225062200) do

  create_table "Recycles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "city_id",        null: false
    t.integer  "subcategory_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["city_id"], name: "fk_rails_bf64904602", using: :btree
    t.index ["subcategory_id"], name: "fk_rails_3565d213f9", using: :btree
  end

  create_table "Subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.integer  "category_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "fk_rails_a492672c94", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.string   "state",                     null: false
    t.string   "zipcode",                   null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "Recycles", "Cities", column: "city_id", on_delete: :cascade
  add_foreign_key "Recycles", "Subcategories", column: "subcategory_id", on_delete: :cascade
  add_foreign_key "Subcategories", "Categories", column: "category_id", on_delete: :cascade
end
