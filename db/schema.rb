ActiveRecord::Schema[7.0].define(version: 2023_03_23_095804) do
  create_table "actions", force: :cascade do |t|
    t.integer "mom_id", null: false
    t.text "description"
    t.string "budget"
    t.date "deadline"
    t.string "appointed_person"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mom_id"], name: "index_actions_on_mom_id"
  end

  create_table "agendas", force: :cascade do |t|
    t.integer "meet_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meets", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "date"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type2"
  end

  create_table "moms", force: :cascade do |t|
    t.string "date"
    t.string "calledby"
    t.text "descrption"
    t.string "title"
    t.string "venue"
    t.integer "callby_id"
    t.integer "meet_id"
    t.string "attendby"
    t.text "report"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "des"
    t.string "department"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actions", "moms"
end
