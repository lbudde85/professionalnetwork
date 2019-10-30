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

ActiveRecord::Schema.define(version: 20170204152515) do

  create_table "brand_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.integer  "category_id"
    t.text     "product_info"
    t.string   "homepage_url"
    t.string   "city"
    t.string   "street"
    t.string   "phone"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_id"], name: "index_brand_profiles_on_category_id"
    t.index ["user_id"], name: "index_brand_profiles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractor_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "description"
    t.string   "contact_person"
    t.string   "contact_position"
    t.string   "contact_email"
    t.string   "homepage_url"
    t.string   "city"
    t.string   "street"
    t.string   "phone"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_contractor_profiles_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "skills"
    t.integer  "experence_level"
    t.integer  "job_period"
    t.text     "qualifications"
    t.text     "questions"
    t.string   "file_attachment_file_name"
    t.string   "file_attachment_content_type"
    t.integer  "file_attachment_file_size"
    t.datetime "file_attachment_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_job_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "tos_confirmed",          default: false
    t.integer  "user_type"
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "country_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
