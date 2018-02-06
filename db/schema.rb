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

ActiveRecord::Schema.define(version: 20180206142343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "week_id"
    t.string "home_team", null: false
    t.string "away_team", null: false
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "week_id"], name: "index_games_on_id_and_week_id", unique: true
    t.index ["week_id"], name: "index_games_on_week_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "league_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_members", default: 100, null: false
    t.integer "invite_only", default: 2, null: false
    t.index ["league_name"], name: "index_leagues_on_league_name", unique: true
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "user_id"
    t.integer "score", default: 0
    t.boolean "commissioner", default: false
    t.index ["league_id", "user_id"], name: "index_memberships_on_league_id_and_user_id", unique: true
    t.index ["league_id"], name: "index_memberships_on_league_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.bigint "game_id"
    t.bigint "week_id"
    t.integer "winning_team", null: false
    t.integer "confidence", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_picks_on_game_id"
    t.index ["league_id"], name: "index_picks_on_league_id"
    t.index ["user_id"], name: "index_picks_on_user_id"
    t.index ["week_id"], name: "index_picks_on_week_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "location", null: false
    t.string "team_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
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
    t.string "profile_photo"
    t.index ["email", "username"], name: "index_users_on_email_and_username", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "week_number", null: false
    t.integer "year", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_number", "year"], name: "index_weeks_on_week_number_and_year", unique: true
  end

end
