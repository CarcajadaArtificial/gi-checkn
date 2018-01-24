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

ActiveRecord::Schema.define(version: 20180124174131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.time "time"
    t.string "location"
    t.string "host"
    t.integer "capacity"
    t.integer "overAttendance"
    t.bigint "event_id"
    t.bigint "activity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.text "answer"
    t.bigint "question_id"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["ticket_id"], name: "index_answers_on_ticket_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "urlName"
    t.date "startDate"
    t.date "endDate"
    t.string "imageUrl"
    t.string "mainColor"
    t.string "color2"
    t.string "locationCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multiple_accesses", force: :cascade do |t|
    t.integer "amount"
    t.bigint "ticket_type_id"
    t.bigint "activity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_multiple_accesses_on_activity_type_id"
    t.index ["ticket_type_id"], name: "index_multiple_accesses_on_ticket_type_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "sentence"
    t.bigint "ticket_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_type_id"], name: "index_questions_on_ticket_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_roles_on_event_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "single_accesses", force: :cascade do |t|
    t.bigint "ticket_type_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_single_accesses_on_activity_id"
    t.index ["ticket_type_id"], name: "index_single_accesses_on_ticket_type_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "reference"
    t.string "badgeNumber"
    t.string "email"
    t.string "fullName"
    t.boolean "sex"
    t.string "state"
    t.bigint "ticket_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "events"
end
