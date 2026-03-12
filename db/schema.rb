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

ActiveRecord::Schema[7.1].define(version: 2026_03_12_141914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "verifications", force: :cascade do |t|
    t.bigint "mentor_id", null: false
    t.bigint "learner_id", null: false
    t.string "skill_name", null: false
    t.string "verification_hash", null: false
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learner_id"], name: "index_verifications_on_learner_id"
    t.index ["mentor_id"], name: "index_verifications_on_mentor_id"
    t.index ["verification_hash"], name: "index_verifications_on_verification_hash", unique: true
  end

  add_foreign_key "verifications", "users", column: "learner_id"
  add_foreign_key "verifications", "users", column: "mentor_id"
end
