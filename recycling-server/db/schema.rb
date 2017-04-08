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

ActiveRecord::Schema.define(version: 20170407093205) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                        null: false
    t.text     "description",   limit: 65535
    t.string   "image_link"
    t.integer  "recycle_class"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.string   "state",                     null: false
    t.string   "zipcode",                   null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "uid",                       null: false
    t.string   "website"
    t.json     "files"
    t.index ["name"], name: "index_cities_on_name", unique: true, using: :btree
  end

  create_table "city_contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "city_id"
    t.string  "name",    null: false
    t.string  "contact", null: false
    t.index ["city_id"], name: "index_city_contacts_on_city_id", using: :btree
  end

  create_table "facilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",           null: false
    t.string   "street_address"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["street_address"], name: "index_facilities_on_street_address", unique: true, using: :btree
  end

  create_table "facility_recycles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "facility_id", null: false
    t.integer "category_id", null: false
    t.index ["facility_id", "category_id"], name: "index_facility_recycles_on_facility_id_and_category_id", unique: true, using: :btree
  end

  create_table "has_facilities", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "city_id",     null: false
    t.integer "facility_id", null: false
    t.index ["city_id", "facility_id"], name: "index_has_facilities_on_city_id_and_facility_id", unique: true, using: :btree
  end

  create_table "recycles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "city_id",        null: false
    t.integer "subcategory_id", null: false
    t.index ["city_id", "subcategory_id"], name: "index_recycles_on_city_id_and_subcategory_id", unique: true, using: :btree
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",                      null: false
    t.text     "description", limit: 65535
    t.string   "image_link"
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
    t.index ["name"], name: "index_subcategories_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "city_id"
    t.string   "name"
    t.string   "state"
    t.string   "zipcode"
    t.string   "job_title"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "city_contacts", "cities"
  add_foreign_key "subcategories", "categories"
end
