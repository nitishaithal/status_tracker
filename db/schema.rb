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

ActiveRecord::Schema.define(version: 20150415094204) do

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "description"
    t.string   "status_goal"
    t.date     "est_time_goal"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "goals", ["project_id"], name: "index_goals_on_project_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "intents", force: :cascade do |t|
    t.text     "description"
    t.integer  "milestone_id"
    t.string   "status_intent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "intents", ["milestone_id"], name: "index_intents_on_milestone_id"

  create_table "milestones", force: :cascade do |t|
    t.integer  "goal_id"
    t.text     "description"
    t.string   "status_milestone"
    t.date     "est_time_milestone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "milestones", ["goal_id"], name: "index_milestones_on_goal_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "posts", ["project_id"], name: "index_posts_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "user_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id"

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
    t.string   "username"
    t.text     "description"
    t.string   "title"
    t.string   "gender"
    t.date     "birthday"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
