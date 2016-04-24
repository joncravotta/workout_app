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

ActiveRecord::Schema.define(version: 20160423224042) do

  create_table "completed_sets", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "workout_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_workouts", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: :cascade do |t|
    t.boolean  "follow"
    t.integer  "user_id"
    t.integer  "workout_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workout_plans", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "summary"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "picture"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.string   "name"
    t.string   "rep_type"
    t.text     "description"
    t.integer  "amount"
    t.integer  "workout_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workout_sets", ["workout_id"], name: "index_workout_sets_on_workout_id"

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "day"
    t.text     "description"
    t.integer  "workout_plan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "workouts", ["workout_plan_id"], name: "index_workouts_on_workout_plan_id"

end
