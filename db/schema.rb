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

ActiveRecord::Schema.define(version: 20170503161151) do

  create_table "deputies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voting_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "not_consider", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voting_rows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "voting_id"
    t.bigint "deputy_id"
    t.bigint "voting_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deputy_id"], name: "index_voting_rows_on_deputy_id"
    t.index ["voting_id"], name: "index_voting_rows_on_voting_id"
    t.index ["voting_result_id"], name: "index_voting_rows_on_voting_result_id"
  end

  create_table "voting_summaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "program_name"
    t.string "department_name"
    t.string "session"
    t.string "number"
    t.datetime "date"
    t.string "title"
    t.text "content"
    t.integer "summary_yea"
    t.integer "summary_nay"
    t.integer "summary_abstained"
    t.integer "not_voted"
    t.integer "absent"
    t.bigint "voting_summary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voting_summary_id"], name: "index_votings_on_voting_summary_id"
  end

  add_foreign_key "voting_rows", "deputies"
  add_foreign_key "voting_rows", "voting_results"
  add_foreign_key "voting_rows", "votings"
end
