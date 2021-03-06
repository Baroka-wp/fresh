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

ActiveRecord::Schema.define(version: 2021_04_30_113356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakships", force: :cascade do |t|
    t.integer "breaker_id"
    t.integer "breaked_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breaked_id"], name: "index_breakships_on_breaked_id"
    t.index ["breaker_id", "breaked_id"], name: "index_breakships_on_breaker_id_and_breaked_id", unique: true
    t.index ["breaker_id"], name: "index_breakships_on_breaker_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "profil"
    t.string "sexe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.integer "age"
    t.string "pays"
    t.string "ville"
    t.text "password_digest"
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
