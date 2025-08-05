# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_06_10_120000) do
  create_table "speaker_proposals", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "talk_title", limit: 100, null: false
    t.text "talk_description", limit: 500, null: false
    t.string "track", null: false
    t.string "audience_level", null: false
    t.text "bio", limit: 250
    t.integer "duration", null: false
    t.boolean "terms_of_participation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
