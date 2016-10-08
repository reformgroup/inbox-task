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

ActiveRecord::Schema.define(version: 20161005175851) do

  create_table "team_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.index ["creator_id"], name: "index_team_users_on_creator_id"
    t.index ["deleter_id"], name: "index_team_users_on_deleter_id"
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["updater_id"], name: "index_team_users_on_updater_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "ancestry"
    t.string   "name",       null: false
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.index ["company_id"], name: "index_teams_on_company_id"
    t.index ["creator_id"], name: "index_teams_on_creator_id"
    t.index ["deleter_id"], name: "index_teams_on_deleter_id"
    t.index ["updater_id"], name: "index_teams_on_updater_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name",           null: false
    t.string   "first_name",          null: false
    t.string   "email",               null: false
    t.integer  "gender",              null: false
    t.date     "birth_date",          null: false
    t.string   "password_digest",     null: false
    t.string   "remember_digest"
    t.integer  "role",                null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "deleted_at"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "deleter_id"
    t.index ["creator_id"], name: "index_users_on_creator_id"
    t.index ["deleter_id"], name: "index_users_on_deleter_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["updater_id"], name: "index_users_on_updater_id"
  end

end
