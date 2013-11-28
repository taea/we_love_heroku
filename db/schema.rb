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

ActiveRecord::Schema.define(version: 20131128064352) do

  create_table "connections", force: true do |t|
    t.integer  "provider_id"
    t.integer  "user_id",       null: false
    t.string   "uid",           null: false
    t.string   "access_token",  null: false
    t.string   "refresh_token"
    t.string   "secret_token"
    t.string   "name",          null: false
    t.string   "email"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "nickname"
  end

  add_index "connections", ["provider_id", "uid"], name: "idx_provider_id_user_key_on_providers_users", unique: true, using: :btree
  add_index "connections", ["user_id"], name: "idx_user_id_on_providers_users", using: :btree

  create_table "providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["name"], name: "idx_name_on_providers", unique: true, using: :btree

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "creator"
    t.string   "hash_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "repository_url"
    t.integer  "user_id"
    t.boolean  "scheduled_access"
    t.boolean  "please_design"
  end

  add_index "sites", ["user_id"], name: "idx_user_id_on_sites", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                              null: false
    t.string   "image",                             null: false
    t.string   "default_provider_id", default: "1"
    t.string   "email",               default: ""
    t.string   "encrypted_password",  default: "",  null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_provider"
    t.string   "locale"
    t.text     "content"
  end

  add_index "users", ["email"], name: "idx_email_on_users", unique: true, using: :btree

end
