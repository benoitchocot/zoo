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

ActiveRecord::Schema[7.1].define(version: 2023_11_27_123434) do
  create_table "animals", force: :cascade do |t|
    t.string "nom"
    t.string "espece"
    t.date "naissance"
    t.date "deces"
    t.string "sexe"
    t.string "observations"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "enclos", force: :cascade do |t|
    t.string "_id"
    t.string "nom"
    t.string "zone"
    t.string "coordonnees"
    t.string "superficie"
    t.string "__t"
    t.integer "temperatureMini"
    t.integer "temperatureMaxi"
    t.integer "hygrometrie"
    t.integer "temperature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especes", force: :cascade do |t|
    t.string "_id"
    t.string "nom"
    t.boolean "sociable"
    t.text "observations"
    t.boolean "dangereux"
    t.string "enclos"
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
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
