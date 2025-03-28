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

ActiveRecord::Schema[8.0].define(version: 2025_03_08_055221) do
  create_table "assignments", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "project_id", null: false
    t.string "role", default: "member", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["project_id", "employee_id"], name: "index_assignments_on_project_id_and_employee_id", unique: true
    t.index ["project_id"], name: "index_assignments_on_project_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.date "start_date", null: false
    t.date "end_date"
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "status", default: "open", null: false
    t.string "priority", default: "medium", null: false
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_support_tickets_on_employee_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "due_date", null: false
    t.string "status", default: "pending", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  add_foreign_key "assignments", "employees"
  add_foreign_key "assignments", "projects", on_delete: :cascade
  add_foreign_key "support_tickets", "employees"
  add_foreign_key "tasks", "projects", on_delete: :cascade
end
