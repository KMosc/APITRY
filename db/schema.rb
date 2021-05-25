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

ActiveRecord::Schema.define(version: 2021_05_25_220400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_halls", force: :cascade do |t|
    t.integer "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "authentication"
    t.integer "age"
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_clients_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "age_restriction"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.bigint "genre_id", null: false
    t.bigint "cinema_hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_hall_id"], name: "index_movies_on_cinema_hall_id"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.string "name"
    t.boolean "automated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "ticket_desk_id", null: false
    t.bigint "cinema_hall_id", null: false
    t.boolean "paid"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_hall_id"], name: "index_tickets_on_cinema_hall_id"
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["ticket_desk_id"], name: "index_tickets_on_ticket_desk_id"
  end

  add_foreign_key "clients", "movies"
  add_foreign_key "movies", "cinema_halls"
  add_foreign_key "movies", "genres"
  add_foreign_key "tickets", "cinema_halls"
  add_foreign_key "tickets", "clients"
  add_foreign_key "tickets", "ticket_desks"
end
