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

ActiveRecord::Schema.define(version: 20170307100614) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                        null: false
    t.text     "description",   limit: 65535
    t.string   "image_link"
    t.string   "recycle_class"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                      null: false
    t.string   "state",                     null: false
    t.string   "zipcode",                   null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name"], name: "index_cities_on_name", unique: true, using: :btree
  end

  create_table "facilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",           null: false
    t.string   "street_address"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["street_address"], name: "index_facilities_on_street_address", unique: true, using: :btree
  end

  create_table "facility_recycles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "facility_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_facility_recycles_on_category_id", using: :btree
    t.index ["facility_id"], name: "index_facility_recycles_on_facility_id", using: :btree
  end

  create_table "has_facilities", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id",     null: false
    t.integer "facility_id", null: false
    t.index ["city_id"], name: "index_has_facilities_on_city_id", using: :btree
    t.index ["facility_id"], name: "index_has_facilities_on_facility_id", using: :btree
  end

  create_table "recycles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id",        null: false
    t.integer "subcategory_id", null: false
    t.index ["city_id", "subcategory_id"], name: "index_recycles_on_city_id_and_subcategory_id", using: :btree
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                      null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
    t.index ["name"], name: "index_subcategories_on_name", unique: true, using: :btree
  end

  add_foreign_key "subcategories", "categories"
end
