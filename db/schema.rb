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

ActiveRecord::Schema.define(version: 2020_07_12_200426) do

  create_table "ballot_proposals", force: :cascade do |t|
    t.integer "ballot_id"
    t.integer "proposal_id"
  end

  create_table "ballots", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.integer "voter_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.boolean "approve?"
  end

  create_table "voters", force: :cascade do |t|
    t.string "user_name"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "drivers_license"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
  end

end
