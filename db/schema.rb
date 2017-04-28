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

ActiveRecord::Schema.define(version: 20170423110005) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.boolean  "isgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "manager_id"
    t.index ["manager_id"], name: "index_artists_on_manager_id"
  end

  create_table "artists_songs", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "song_id"
    t.index ["artist_id"], name: "index_artists_songs_on_artist_id"
    t.index ["song_id"], name: "index_artists_songs_on_song_id"
  end

  create_table "bands", force: :cascade do |t|
    t.date     "joining"
    t.date     "leaving"
    t.integer  "group_id"
    t.integer  "individual_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["group_id"], name: "index_bands_on_group_id"
    t.index ["individual_id"], name: "index_bands_on_individual_id"
  end

  create_table "concert_songs", force: :cascade do |t|
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setlists", force: :cascade do |t|
    t.integer  "position"
    t.integer  "concert_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_setlists_on_concert_id"
    t.index ["song_id"], name: "index_setlists_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
