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

ActiveRecord::Schema.define(version: 20150119090933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "pieces", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "snippet_id", null: false
    t.string   "name",       null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pieces", ["snippet_id"], name: "pieces_ix_snippet_id", using: :btree

  create_table "que_jobs", primary_key: "queue", force: :cascade do |t|
    t.integer  "priority",    limit: 2, default: 100,                                        null: false
    t.datetime "run_at",                default: "now()",                                    null: false
    t.integer  "job_id",      limit: 8, default: "nextval('que_jobs_job_id_seq'::regclass)", null: false
    t.text     "job_class",                                                                  null: false
    t.json     "args",                  default: [],                                         null: false
    t.integer  "error_count",           default: 0,                                          null: false
    t.text     "last_error"
  end

  create_table "snippets", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "owner_id",    null: false
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "snippets", ["owner_id"], name: "snippets_ix_owner_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                   default: ""
    t.string   "email",                  default: "",    null: false
    t.string   "username",               default: ""
    t.boolean  "admin",                  default: false, null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.uuid     "invited_by_id"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["confirmation_token"], name: "users_uix_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "users_uix_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "users_uix_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "users_ix_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "users_uix_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "users_uix_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "users_uix_username", unique: true, using: :btree

end
