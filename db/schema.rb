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

ActiveRecord::Schema.define(version: 2022_05_22_061621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.bigint "workspace_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_boards_on_slug", unique: true
    t.index ["workspace_id"], name: "index_boards_on_workspace_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.string "description"
    t.bigint "checklist_id", null: false
    t.boolean "is_complete", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_checklists_on_task_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "content"
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_comments_on_member_id"
    t.index ["task_id"], name: "index_comments_on_task_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "member_workspaces", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "workspace_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_member_workspaces_on_member_id"
    t.index ["workspace_id"], name: "index_member_workspaces_on_workspace_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "board_id", null: false
    t.integer "state"
    t.date "due_date"
    t.integer "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["board_id"], name: "index_tasks_on_board_id"
    t.index ["slug"], name: "index_tasks_on_slug", unique: true
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_workspaces_on_slug", unique: true
  end

  add_foreign_key "boards", "workspaces"
  add_foreign_key "checklist_items", "checklists"
  add_foreign_key "checklists", "tasks"
  add_foreign_key "comments", "members"
  add_foreign_key "comments", "tasks"
  add_foreign_key "member_workspaces", "members"
  add_foreign_key "member_workspaces", "workspaces"
  add_foreign_key "tasks", "boards"
end
