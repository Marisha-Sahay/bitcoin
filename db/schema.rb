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

ActiveRecord::Schema.define(version: 20180102061256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "carted_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorized_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categorized_resources", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "resource_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "coins", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "coin_url"
    t.string   "image_url"
    t.string   "TotalCoinSupply"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "reddit_link"
    t.string   "twitter_link"
  end

  create_table "email_subscriptions", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "featured_contents", force: :cascade do |t|
    t.string   "news_url"
    t.string   "site_full"
    t.text     "title"
    t.text     "description"
    t.datetime "published"
    t.string   "main_image"
    t.integer  "performance_score"
    t.integer  "domain_rank"
    t.integer  "facebook_like"
    t.integer  "facebook_comment"
    t.integer  "facebook_share"
    t.integer  "linkedin_share"
    t.string   "author"
    t.float    "rating"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "news_url"
    t.string   "site_full"
    t.text     "title"
    t.text     "description"
    t.datetime "published"
    t.string   "main_image"
    t.integer  "performance_score"
    t.integer  "domain_rank"
    t.integer  "facebook_like"
    t.integer  "facebook_comment"
    t.integer  "facebook_share"
    t.integer  "linkedin_share"
    t.string   "author"
    t.float    "rating"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 5, scale: 2
    t.decimal  "tax",        precision: 5, scale: 2
    t.decimal  "total",      precision: 5, scale: 2
    t.boolean  "complete"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 6, scale: 2
    t.text     "description"
    t.string   "size"
    t.boolean  "in_stock"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "resource_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "resource_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "short_desc"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "category"
    t.string   "link"
    t.string   "currency"
    t.integer  "score"
    t.integer  "length"
    t.string   "video_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

end
