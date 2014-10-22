# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141018135630) do

  create_table "ideas", force: true do |t|
    t.integer  "owner_id"
    t.string   "title",       null: false
    t.text     "description"
    t.string   "file"
    t.integer  "row_order"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["owner_id"], name: "index_ideas_on_owner_id", using: :btree

  create_table "like_ideas", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "like_ideas", ["idea_id"], name: "index_like_ideas_on_idea_id", using: :btree
  add_index "like_ideas", ["user_id", "idea_id"], name: "index_like_ideas_on_user_id_and_idea_id", unique: true, using: :btree
  add_index "like_ideas", ["user_id"], name: "index_like_ideas_on_user_id", using: :btree

  create_table "rating_ideas", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.integer  "impact"
    t.integer  "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_ideas", ["idea_id"], name: "index_rating_ideas_on_idea_id", using: :btree
  add_index "rating_ideas", ["user_id", "idea_id"], name: "index_rating_ideas_on_user_id_and_idea_id", unique: true, using: :btree
  add_index "rating_ideas", ["user_id"], name: "index_rating_ideas_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "relating_id"
    t.integer  "related_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["related_id"], name: "index_relationships_on_related_id", using: :btree
  add_index "relationships", ["relating_id", "related_id"], name: "index_relationships_on_relating_id_and_related_id", unique: true, using: :btree
  add_index "relationships", ["relating_id"], name: "index_relationships_on_relating_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "name",       null: false
    t.string   "image_url",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
