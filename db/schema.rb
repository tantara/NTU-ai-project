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

ActiveRecord::Schema.define(version: 20160619125207) do

  create_table "article_keywords", force: :cascade do |t|
    t.integer  "keyword_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_keywords", ["article_id"], name: "index_article_keywords_on_article_id"
  add_index "article_keywords", ["keyword_id"], name: "index_article_keywords_on_keyword_id"

  create_table "articles", force: :cascade do |t|
    t.string   "headline"
    t.string   "url"
    t.string   "nid"
    t.datetime "published_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "count",        default: 0
    t.string   "section"
    t.string   "reporter"
    t.string   "media"
    t.string   "abstract"
    t.boolean  "hidden",       default: false
  end

  add_index "articles", ["nid"], name: "index_articles_on_nid", unique: true

  create_table "keywords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "count",      default: 0
  end

  add_index "keywords", ["name"], name: "index_keywords_on_name", unique: true

  create_table "lda_group_articles", force: :cascade do |t|
    t.integer  "lda_group_id"
    t.integer  "article_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "lda_group_articles", ["article_id"], name: "index_lda_group_articles_on_article_id"
  add_index "lda_group_articles", ["lda_group_id"], name: "index_lda_group_articles_on_lda_group_id"

  create_table "lda_groups", force: :cascade do |t|
    t.string   "gid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hidden",     default: false
  end

  add_index "lda_groups", ["gid"], name: "index_lda_groups_on_gid"

  create_table "lsa_group_articles", force: :cascade do |t|
    t.integer  "lsa_group_id"
    t.integer  "article_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "lsa_group_articles", ["article_id"], name: "index_lsa_group_articles_on_article_id"
  add_index "lsa_group_articles", ["lsa_group_id"], name: "index_lsa_group_articles_on_lsa_group_id"

  create_table "lsa_groups", force: :cascade do |t|
    t.string   "gid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hidden",     default: false
  end

  add_index "lsa_groups", ["gid"], name: "index_lsa_groups_on_gid"

end
