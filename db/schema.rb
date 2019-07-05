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

ActiveRecord::Schema.define(version: 2019_06_07_085652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultations", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "consultation_type"
    t.text "required_documents"
    t.text "patient_complain"
    t.text "diagnostic"
    t.text "care_plan"
    t.text "prescription"
    t.text "note_patient"
    t.string "patient_note_attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
  end

  create_table "emails", force: :cascade do |t|
    t.bigint "consultation_id"
    t.string "title"
    t.text "content"
    t.text "description"
    t.string "subject"
    t.string "photo1_url"
    t.string "photo2_url"
    t.string "photo3_url"
    t.string "article_1_url"
    t.string "article_2_url"
    t.string "article_3_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "last_update_date"
    t.index ["consultation_id"], name: "index_emails_on_consultation_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id"
    t.string "gender"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "job_title"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "photo"
    t.string "office_address"
    t.text "office_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "patients"
  add_foreign_key "emails", "consultations"
  add_foreign_key "patients", "users"
end
