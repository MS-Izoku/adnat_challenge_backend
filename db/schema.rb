# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_30_183637) do

  create_table "breaks", force: :cascade do |t|
    t.integer "shift_id"
    t.float "duration"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.float "hourly"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "start"
    t.datetime "finish"
    t.float "break_length"
    t.integer "user_id"
    t.float "duration"
    t.integer "organization_id"
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.string "email"
    t.string "password_digest"
  end

end
