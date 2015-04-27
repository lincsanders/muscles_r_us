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

ActiveRecord::Schema.define(version: 20150427123746) do

  create_table "excersises", force: :cascade do |t|
    t.string   "name"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "last_completed_weight", default: 17.5
  end

  create_table "excersises_workouts", force: :cascade do |t|
    t.integer "excersise_id"
    t.integer "workout_id"
  end

  add_index "excersises_workouts", ["excersise_id"], name: "index_excersises_workouts_on_excersise_id"
  add_index "excersises_workouts", ["workout_id"], name: "index_excersises_workouts_on_workout_id"

  create_table "rep_sets", force: :cascade do |t|
    t.integer  "excersise_id"
    t.integer  "reps"
    t.boolean  "completed",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workout_sessions", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                                                       null: false
    t.datetime "updated_at",                                                                                       null: false
    t.float    "weight"
    t.text     "completed_workout", default: "--- !ruby/object:OpenStruct\ntable:\n  :completed_excersises: []\n"
  end

  add_index "workout_sessions", ["user_id"], name: "index_workout_sessions_on_user_id"
  add_index "workout_sessions", ["workout_id"], name: "index_workout_sessions_on_workout_id"

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
