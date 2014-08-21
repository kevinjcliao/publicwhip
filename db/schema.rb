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

ActiveRecord::Schema.define(version: 20140821075351) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "pw_cache_divinfo", id: false, force: true do |t|
    t.integer "division_id",      null: false
    t.integer "rebellions",       null: false
    t.integer "tells",            null: false
    t.integer "turnout",          null: false
    t.integer "possible_turnout", null: false
    t.integer "aye_majority",     null: false
  end

  add_index "pw_cache_divinfo", ["division_id"], name: "division_id", using: :btree

  create_table "pw_cache_divwiki", id: false, force: true do |t|
    t.date    "division_date",             null: false
    t.integer "division_number",           null: false
    t.string  "house",           limit: 8, null: false
    t.integer "wiki_id",                   null: false
  end

  add_index "pw_cache_divwiki", ["division_date", "division_number", "house"], name: "division_date", unique: true, using: :btree

  create_table "pw_cache_dreamreal_distance", id: false, force: true do |t|
    t.integer "dream_id",                      null: false
    t.integer "person",                        null: false
    t.integer "nvotessame"
    t.integer "nvotessamestrong"
    t.integer "nvotesdiffer"
    t.integer "nvotesdifferstrong"
    t.integer "nvotesabsent"
    t.integer "nvotesabsentstrong"
    t.float   "distance_a",         limit: 24
    t.float   "distance_b",         limit: 24
  end

  add_index "pw_cache_dreamreal_distance", ["dream_id", "person"], name: "dream_id_2", unique: true, using: :btree
  add_index "pw_cache_dreamreal_distance", ["dream_id"], name: "dream_id", using: :btree
  add_index "pw_cache_dreamreal_distance", ["person"], name: "person", using: :btree

  create_table "pw_cache_mpinfo", id: false, force: true do |t|
    t.integer "mp_id",          null: false
    t.integer "rebellions",     null: false
    t.integer "tells",          null: false
    t.integer "votes_attended", null: false
    t.integer "votes_possible", null: false
    t.integer "aye_majority",   null: false
  end

  add_index "pw_cache_mpinfo", ["mp_id"], name: "mp_id", using: :btree

  create_table "pw_cache_realreal_distance", id: false, force: true do |t|
    t.integer "mp_id1",                  null: false
    t.integer "mp_id2",                  null: false
    t.integer "nvotessame"
    t.integer "nvotesdiffer"
    t.integer "nvotesabsent"
    t.float   "distance_a",   limit: 24
    t.float   "distance_b",   limit: 24
  end

  add_index "pw_cache_realreal_distance", ["mp_id1", "mp_id2"], name: "mp_id1_2", unique: true, using: :btree
  add_index "pw_cache_realreal_distance", ["mp_id1"], name: "mp_id1", using: :btree
  add_index "pw_cache_realreal_distance", ["mp_id2"], name: "mp_id2", using: :btree

  create_table "pw_cache_whip", id: false, force: true do |t|
    t.integer "division_id",                  null: false
    t.string  "party",            limit: 200, null: false
    t.integer "aye_votes",                    null: false
    t.integer "aye_tells",                    null: false
    t.integer "no_votes",                     null: false
    t.integer "no_tells",                     null: false
    t.integer "both_votes",                   null: false
    t.integer "abstention_votes",             null: false
    t.integer "possible_votes",               null: false
    t.string  "whip_guess",       limit: 10,  null: false
  end

  add_index "pw_cache_whip", ["division_id", "party"], name: "division_id", unique: true, using: :btree

  create_table "pw_constituency", id: false, force: true do |t|
    t.integer "cons_id",                                      null: false
    t.string  "name",      limit: 100,                        null: false
    t.boolean "main_name",                                    null: false
    t.date    "from_date",             default: '1000-01-01', null: false
    t.date    "to_date",               default: '9999-12-31', null: false
    t.string  "house",     limit: 8,   default: "commons",    null: false
  end

  add_index "pw_constituency", ["cons_id", "name"], name: "cons_id", using: :btree
  add_index "pw_constituency", ["from_date"], name: "from_date", using: :btree
  add_index "pw_constituency", ["name"], name: "name", using: :btree
  add_index "pw_constituency", ["to_date"], name: "to_date", using: :btree

  create_table "pw_division", primary_key: "division_id", force: true do |t|
    t.boolean "valid"
    t.date    "division_date",             null: false
    t.integer "division_number",           null: false
    t.string  "house",           limit: 8, null: false
    t.text    "division_name",             null: false
    t.binary  "source_url",                null: false
    t.binary  "debate_url",                null: false
    t.binary  "motion",                    null: false
    t.binary  "notes",                     null: false
    t.text    "clock_time"
    t.text    "source_gid",                null: false
    t.text    "debate_gid",                null: false
  end

  add_index "pw_division", ["division_date", "division_number", "house"], name: "division_date_2", unique: true, using: :btree
  add_index "pw_division", ["division_date"], name: "division_date", using: :btree
  add_index "pw_division", ["division_number"], name: "division_number", using: :btree
  add_index "pw_division", ["house"], name: "house", using: :btree

  create_table "pw_dyn_dreammp", primary_key: "dream_id", force: true do |t|
    t.string  "name",        limit: 100, null: false
    t.integer "user_id",                 null: false
    t.binary  "description",             null: false
    t.integer "private",     limit: 1,   null: false
  end

  add_index "pw_dyn_dreammp", ["dream_id", "name", "user_id"], name: "dream_id", unique: true, using: :btree
  add_index "pw_dyn_dreammp", ["user_id"], name: "user_id", using: :btree

  create_table "pw_dyn_dreamvote", id: false, force: true do |t|
    t.date    "division_date",              null: false
    t.integer "division_number",            null: false
    t.string  "house",           limit: 8,  null: false
    t.integer "dream_id",                   null: false
    t.string  "vote",            limit: 10, null: false
  end

  add_index "pw_dyn_dreamvote", ["division_date", "division_number", "house", "dream_id"], name: "division_date_2", unique: true, using: :btree
  add_index "pw_dyn_dreamvote", ["division_date"], name: "division_date", using: :btree
  add_index "pw_dyn_dreamvote", ["division_number"], name: "division_number", using: :btree
  add_index "pw_dyn_dreamvote", ["dream_id"], name: "dream_id", using: :btree

  create_table "pw_dyn_user", primary_key: "user_id", force: true do |t|
    t.text     "user_name"
    t.text     "real_name"
    t.text     "email"
    t.text     "legacy_password"
    t.text     "remote_addr"
    t.text     "confirm_hash"
    t.text     "confirm_return_url"
    t.integer  "is_confirmed",           default: 0,  null: false
    t.datetime "reg_date"
    t.integer  "active_policy_id"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "pw_dyn_user", ["confirmation_token"], name: "index_pw_dyn_user_on_confirmation_token", unique: true, using: :btree
  add_index "pw_dyn_user", ["reset_password_token"], name: "index_pw_dyn_user_on_reset_password_token", unique: true, using: :btree

  create_table "pw_dyn_wiki_motion", primary_key: "wiki_id", force: true do |t|
    t.date     "division_date",             null: false
    t.integer  "division_number",           null: false
    t.string   "house",           limit: 8, null: false
    t.text     "text_body",                 null: false
    t.integer  "user_id",                   null: false
    t.datetime "edit_date"
  end

  add_index "pw_dyn_wiki_motion", ["division_date", "division_number", "house"], name: "division_date", using: :btree

  create_table "pw_moffice", primary_key: "moffice_id", force: true do |t|
    t.string  "dept",           limit: 100,                        null: false
    t.string  "position",       limit: 100,                        null: false
    t.string  "responsibility", limit: 100,                        null: false
    t.date    "from_date",                  default: '1000-01-01', null: false
    t.date    "to_date",                    default: '9999-12-31', null: false
    t.integer "person"
  end

  add_index "pw_moffice", ["person"], name: "person", using: :btree

  create_table "pw_mp", primary_key: "mp_id", force: true do |t|
    t.string  "gid",            limit: 100,                        null: false
    t.text    "source_gid",                                        null: false
    t.string  "first_name",     limit: 100,                        null: false
    t.string  "last_name",      limit: 100,                        null: false
    t.string  "title",          limit: 50,                         null: false
    t.string  "constituency",   limit: 100,                        null: false
    t.string  "party",          limit: 100,                        null: false
    t.string  "house",          limit: 8,                          null: false
    t.date    "entered_house",              default: '1000-01-01', null: false
    t.date    "left_house",                 default: '9999-12-31', null: false
    t.string  "entered_reason", limit: 16,  default: "unknown",    null: false
    t.string  "left_reason",    limit: 28,  default: "unknown",    null: false
    t.integer "person"
  end

  add_index "pw_mp", ["entered_house"], name: "entered_house", using: :btree
  add_index "pw_mp", ["gid"], name: "gid", using: :btree
  add_index "pw_mp", ["house"], name: "house", using: :btree
  add_index "pw_mp", ["left_house"], name: "left_house", using: :btree
  add_index "pw_mp", ["party"], name: "party", using: :btree
  add_index "pw_mp", ["person"], name: "person", using: :btree
  add_index "pw_mp", ["title", "first_name", "last_name", "constituency", "entered_house", "left_house", "house"], name: "title", unique: true, using: :btree

  create_table "pw_vote", id: false, force: true do |t|
    t.integer "division_id",            null: false
    t.integer "mp_id",                  null: false
    t.string  "vote",        limit: 10, null: false
  end

  add_index "pw_vote", ["division_id", "mp_id", "vote"], name: "division_id_2", unique: true, using: :btree
  add_index "pw_vote", ["division_id"], name: "division_id", using: :btree
  add_index "pw_vote", ["mp_id"], name: "mp_id", using: :btree
  add_index "pw_vote", ["vote"], name: "vote", using: :btree

  create_table "pw_vote_sortorder", id: false, force: true do |t|
    t.string  "vote",     limit: 10, null: false
    t.integer "position",            null: false
  end

end
