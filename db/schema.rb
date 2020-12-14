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

ActiveRecord::Schema.define(version: 2020_12_14_132503) do

  create_table "countups", force: :cascade do |t|
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gamemode_id"
    t.integer "user_id"
    t.index ["gamemode_id"], name: "index_countups_on_gamemode_id"
    t.index ["user_id"], name: "index_countups_on_user_id"
  end

  create_table "gamemodes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "modename"
    t.integer "countup_id"
    t.index ["countup_id"], name: "index_gamemodes_on_countup_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "r_first"
    t.string "r_second"
    t.string "r_third"
    t.integer "r_sum"
    t.float "r_ave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "countup_id"
    t.index ["countup_id"], name: "index_rounds_on_countup_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
