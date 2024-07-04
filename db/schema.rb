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

ActiveRecord::Schema[7.1].define(version: 2024_07_04_132237) do
  create_table "bugs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_id", null: false
    t.index ["component_id"], name: "index_bugs_on_component_id"
  end

  create_table "bugs_tags", id: false, force: :cascade do |t|
    t.integer "bug_id", null: false
    t.integer "tag_id", null: false
    t.index ["bug_id", "tag_id"], name: "index_bugs_tags_on_bug_id_and_tag_id"
    t.index ["tag_id", "bug_id"], name: "index_bugs_tags_on_tag_id_and_bug_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.boolean "to_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components_tags", id: false, force: :cascade do |t|
    t.integer "component_id", null: false
    t.integer "tag_id", null: false
    t.index ["component_id", "tag_id"], name: "index_components_tags_on_component_id_and_tag_id"
    t.index ["tag_id", "component_id"], name: "index_components_tags_on_tag_id_and_component_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_test_cases", id: false, force: :cascade do |t|
    t.integer "test_case_id", null: false
    t.integer "tag_id", null: false
    t.index ["tag_id", "test_case_id"], name: "index_tags_test_cases_on_tag_id_and_test_case_id"
    t.index ["test_case_id", "tag_id"], name: "index_tags_test_cases_on_test_case_id_and_tag_id"
  end

  create_table "test_cases", force: :cascade do |t|
    t.string "name"
    t.text "steps"
    t.boolean "to_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_id", null: false
    t.index ["component_id"], name: "index_test_cases_on_component_id"
  end

  add_foreign_key "bugs", "components"
  add_foreign_key "test_cases", "components"
end
