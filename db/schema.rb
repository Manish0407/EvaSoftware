# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_05_10_073328) do
  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.string "email"
    t.string "gst_number"
    t.string "website"
    t.string "external_account_code"
    t.string "remark"
    t.string "phone_number"
    t.string "address1"
    t.string "address2"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_accounts_on_employee_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "full_name"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "salutation"
    t.string "full_name"
    t.string "phone_number"
    t.string "email"
    t.string "designation"
    t.text "remark"
    t.string "address1"
    t.string "address2"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "employee_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.string "desing_ref"
    t.string "quantity"
    t.string "desing_name"
    t.string "location"
    t.string "floor_number"
    t.string "note"
    t.integer "glass_item_id"
    t.float "price"
    t.float "width"
    t.float "height"
    t.float "area"
    t.float "total_weight"
    t.float "rate_of_sqft"
    t.json "handles", default: {}
    t.json "seactions", default: {}
    t.integer "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["glass_item_id"], name: "index_designs_on_glass_item_id"
    t.index ["quote_id"], name: "index_designs_on_quote_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "glass_items", force: :cascade do |t|
    t.string "enternal_code"
    t.string "glass_code"
    t.decimal "glass_thickness"
    t.string "report_category"
    t.decimal "glass_weight"
    t.string "unit"
    t.string "glass_color"
    t.decimal "basic_value_in_sqmt"
    t.decimal "basic_value_in_sqFt"
    t.decimal "total_glass_value"
    t.string "glass_name"
    t.string "glass_alias"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hardware_prices", force: :cascade do |t|
    t.string "rm_code"
    t.string "item_name"
    t.string "brand_name"
    t.string "unit"
    t.string "currency"
    t.decimal "default_price_rate"
    t.decimal "weight_per_unit"
    t.string "select_price_level"
    t.string "rate_calculate_formula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "location_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "project_name"
    t.string "full_name"
    t.string "salutation"
    t.string "phone_number"
    t.string "email"
    t.text "note"
    t.string "address1"
    t.string "address2"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "bill_to"
    t.string "marketing_partner"
    t.integer "employee_id"
    t.integer "account_id"
    t.string "opportunity_stage"
    t.string "opportunity_source"
    t.string "opportunity_category"
    t.decimal "estimated_opportunity_value"
    t.date "expected_closure_date"
    t.date "expected_supply_start_date"
    t.date "expected_supply_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_gateways", force: :cascade do |t|
    t.integer "opportunity_id"
    t.string "payment_medium"
    t.string "transaction_no"
    t.decimal "amount"
    t.datetime "payment_date_and_time"
    t.text "description"
    t.text "reason"
    t.integer "audit_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_rm_item_details", force: :cascade do |t|
    t.string "rm_code"
    t.string "rm_item_name"
    t.decimal "standard_bar_length"
    t.decimal "cutting_blade_thickness"
    t.decimal "standard_bar_total_trim_length"
    t.decimal "reusable_offcut_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.decimal "area"
    t.decimal "price"
    t.integer "opportunity_id"
    t.datetime "expected_quote_start_date"
    t.datetime "expected_quote_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raw_material_prices", force: :cascade do |t|
    t.string "rm_code"
    t.string "item_name"
    t.string "brand_name"
    t.string "unit"
    t.string "currency"
    t.decimal "default_price_rate"
    t.decimal "weight_per_unit"
    t.string "select_price_level"
    t.string "rate_calculate_formula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reinforcement_prices", force: :cascade do |t|
    t.string "rm_code"
    t.string "item_name"
    t.string "brand_name"
    t.string "unit"
    t.string "currency"
    t.decimal "default_price_rate"
    t.decimal "weight_per_unit"
    t.string "parent_code"
    t.string "select_price_level"
    t.string "rate_calculate_formula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_offices", force: :cascade do |t|
    t.string "sales_office_name"
    t.text "sales_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_title"
    t.integer "employee_id"
    t.string "task_medium"
    t.datetime "schedule"
    t.string "status"
    t.text "task_description"
    t.integer "opportunity_id"
    t.string "opportunity_stage"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "territory_locations", force: :cascade do |t|
    t.integer "territory_master_id"
    t.text "hierarchical_geography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "territory_masters", force: :cascade do |t|
    t.string "territory_name"
    t.text "territory_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_territories", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "territory_master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "window_materials", force: :cascade do |t|
    t.integer "window_id"
    t.string "material_type"
    t.integer "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_type", "material_id"], name: "index_window_materials_on_material"
    t.index ["window_id"], name: "index_window_materials_on_window_id"
  end

  create_table "windows", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "design_id"
    t.integer "account_id"
    t.string "location"
    t.string "floor_number"
    t.string "note"
    t.string "quantity"
    t.string "glass_type"
    t.string "glass_thickness"
    t.string "glass_color"
    t.string "glass_ref"
    t.string "glass_size"
    t.string "glass_weight"
    t.string "glass_area"
    t.string "glass_price"
    t.string "glass_total_weight"
    t.string "glass_rate_of_sqft"
    t.string "glass_total_price"
    t.float "window_total_price"
    t.string "height"
    t.string "width"
    t.string "area"
    t.string "total_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_windows_on_account_id"
    t.index ["design_id"], name: "index_windows_on_design_id"
  end

  add_foreign_key "accounts", "employees"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

