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

ActiveRecord::Schema.define(version: 20170731103350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.boolean  "isgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_concerts", id: false, force: :cascade do |t|
    t.integer "artist_id",  null: false
    t.integer "concert_id", null: false
  end

  create_table "artists_songs", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "song_id"
    t.index ["artist_id"], name: "index_artists_songs_on_artist_id", using: :btree
    t.index ["song_id"], name: "index_artists_songs_on_song_id", using: :btree
  end

  create_table "bands", force: :cascade do |t|
    t.date     "joining"
    t.date     "leaving"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "group_id"
    t.integer  "individual_id"
    t.index ["group_id"], name: "index_bands_on_group_id", using: :btree
    t.index ["individual_id"], name: "index_bands_on_individual_id", using: :btree
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
    t.integer  "venue_id"
    t.index ["venue_id"], name: "index_concerts_on_venue_id", using: :btree
  end

  create_table "concerts_performers", id: false, force: :cascade do |t|
    t.integer "concert_id",   null: false
    t.integer "performer_id", null: false
  end

  create_table "ensembles", force: :cascade do |t|
    t.date     "joining"
    t.date     "leaving"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "individual_id"
    t.integer  "group_id"
    t.index ["group_id"], name: "index_ensembles_on_group_id", using: :btree
    t.index ["individual_id"], name: "index_ensembles_on_individual_id", using: :btree
  end

  create_table "performers", force: :cascade do |t|
    t.string   "type"
    t.string   "pname"
    t.string   "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers_setlists", id: false, force: :cascade do |t|
    t.integer "performer_id", null: false
    t.integer "setlist_id",   null: false
  end

  create_table "setlists", force: :cascade do |t|
    t.integer  "position"
    t.integer  "concert_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_setlists_on_concert_id", using: :btree
    t.index ["song_id"], name: "index_setlists_on_song_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ytid"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bands", "artists", column: "group_id"
  add_foreign_key "bands", "artists", column: "individual_id"
  add_foreign_key "concerts", "venues"
  add_foreign_key "ensembles", "performers", column: "group_id"
  add_foreign_key "ensembles", "performers", column: "individual_id"
  add_foreign_key "setlists", "concerts"
  add_foreign_key "setlists", "songs"
end
