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

ActiveRecord::Schema.define(version: 20161128010527) do

  create_table "assignment_companies", force: :cascade do |t|
    t.integer  "category"
    t.string   "name"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_assignment_companies_on_assignment_id"
  end

  create_table "assignment_contacts", force: :cascade do |t|
    t.integer  "role"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "assignment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "company_category"
    t.string   "company_name"
    t.index ["assignment_id"], name: "index_assignment_contacts_on_assignment_id"
  end

  create_table "assignment_notes", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_assignment_notes_on_assignment_id"
    t.index ["user_id"], name: "index_assignment_notes_on_user_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.datetime "date_assigned"
    t.datetime "original_insp_date"
    t.datetime "return_insp_date"
    t.string   "job_number"
    t.integer  "loss_category"
    t.string   "loss_description"
    t.string   "mitigation_status"
    t.string   "abatement_status"
    t.string   "claim_number"
    t.string   "estimate_status"
    t.datetime "target_start_date"
    t.datetime "target_end_date"
    t.datetime "actual_start_date"
    t.datetime "actual_end_date"
    t.boolean  "is_on_xa"
    t.integer  "estimator_experience"
    t.float    "estimate_total"
    t.integer  "assignment_stage"
    t.integer  "lost_sales_related"
    t.integer  "lost_other"
    t.boolean  "is_contract_signed"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "year_built"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.boolean  "is_read"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "text"
    t.boolean  "is_high_priority"
    t.datetime "date_due"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "role"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
