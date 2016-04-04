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

ActiveRecord::Schema.define(version: 20160404055926) do

  create_table "accounting_codes", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "check_voucher_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "billing_particulars", force: :cascade do |t|
    t.string   "particular"
    t.string   "currency"
    t.float    "amount"
    t.integer  "billing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "billings", force: :cascade do |t|
    t.integer  "bill_no"
    t.date     "bill_date"
    t.string   "certified_by"
    t.integer  "client_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cash_particulars", force: :cascade do |t|
    t.string   "particular"
    t.float    "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cash_voucher_id"
  end

  create_table "cash_vouchers", force: :cascade do |t|
    t.integer  "reference_no"
    t.date     "cash_date"
    t.string   "paid_to"
    t.string   "address"
    t.string   "received_from"
    t.string   "amount"
    t.string   "prepared_by"
    t.string   "checked_by"
    t.string   "approved_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "check_accounts", force: :cascade do |t|
    t.integer  "check_voucher_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "accounting_code_id"
    t.decimal  "amount"
    t.string   "trans_type"
  end

  create_table "check_particulars", force: :cascade do |t|
    t.string   "particular"
    t.decimal  "amount"
    t.integer  "check_voucher_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "amount_in_word"
  end

  create_table "check_vouchers", force: :cascade do |t|
    t.string   "payee"
    t.string   "reference_no"
    t.date     "check_date"
    t.string   "bank"
    t.string   "received_by"
    t.string   "prepared_by"
    t.string   "certified_by"
    t.string   "approved_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "check_no"
    t.string   "si_no"
    t.string   "or_no"
    t.string   "apv_no"
    t.integer  "counter"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "client_name"
    t.string   "address"
    t.string   "telephone"
    t.string   "email_address"
    t.string   "company_name"
    t.string   "website"
    t.string   "status"
    t.string   "tin"
    t.string   "company_address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "primary_contact"
    t.string   "secondary_contact"
    t.integer  "order_id"
    t.integer  "order_particular_id"
  end

  create_table "company_expenses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount"
    t.text     "remarks"
    t.date     "exdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_profiles", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "company_name"
    t.text     "address"
    t.string   "telephone"
    t.string   "website"
    t.string   "tin"
    t.text     "mission"
    t.text     "vission"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "costings", force: :cascade do |t|
    t.string   "description"
    t.decimal  "cost"
    t.integer  "proposal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "position"
    t.string   "email"
    t.string   "contact_no"
    t.date     "birthdate"
    t.string   "address"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "gender"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
    t.integer  "employee_no"
    t.date     "date_employed"
    t.string   "status"
  end

  create_table "feature_lists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "proposal_id"
    t.integer  "parent_feature_list_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "order_particulars", force: :cascade do |t|
    t.integer  "service_product_id"
    t.integer  "quantity"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "order_id"
    t.integer  "client_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "client_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "order_particular_id"
  end

  create_table "petty_particulars", force: :cascade do |t|
    t.string   "particular"
    t.float    "amount"
    t.integer  "petty_voucher_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "petty_vouchers", force: :cascade do |t|
    t.integer  "reference_no"
    t.date     "petty_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "payee"
    t.string   "approved_by"
    t.string   "paid_by"
    t.string   "received_by"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title"
    t.date     "proposal_date"
    t.text     "overview"
    t.text     "objective"
    t.text     "hardware"
    t.text     "software"
    t.text     "feature"
    t.string   "project_costing_text"
    t.text     "signatory"
    t.integer  "employee_id"
    t.integer  "client_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "system_architecture_file_name"
    t.string   "system_architecture_content_type"
    t.integer  "system_architecture_file_size"
    t.datetime "system_architecture_updated_at"
  end

  create_table "service_products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.integer  "code"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "software_browsers", force: :cascade do |t|
    t.string   "name"
    t.integer  "proposal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "software_requirements", force: :cascade do |t|
    t.string   "component"
    t.decimal  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proposal_id"
  end

  create_table "terms_conditions", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "proposal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "username"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "work_experiences", force: :cascade do |t|
    t.string   "title"
    t.string   "company_name"
    t.string   "company_address"
    t.date     "date_ended"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "employee_id"
  end

end
