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

ActiveRecord::Schema[7.0].define(version: 2023_03_22_151355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authorings", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "authorabble_type", null: false
    t.bigint "authorabble_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_authorings_on_author_id"
    t.index ["authorabble_type", "authorabble_id"], name: "index_authorings_on_authorabble"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "twitterUrl"
    t.string "githubUrl"
    t.string "siteUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "photo"
    t.string "mastodon_url"
    t.index ["slug"], name: "index_authors_on_slug", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "free"
    t.integer "page"
    t.string "isbn"
    t.string "getBookOnAmazonUrl"
    t.string "getBookOnSiteTitle"
    t.string "getBookOnSiteUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.integer "year"
    t.string "slug"
    t.string "cover"
    t.boolean "featured"
    t.index ["slug"], name: "index_books_on_slug", unique: true
  end

  create_table "communities", force: :cascade do |t|
    t.string "title"
    t.string "cover"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "slug"
    t.integer "source"
    t.index ["slug"], name: "index_communities_on_slug", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "free"
    t.string "courseSiteTitle"
    t.string "courseSiteUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "cover"
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "date"
    t.string "url"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.bigint "youtube_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_lessons_on_slug", unique: true
    t.index ["youtube_id"], name: "index_lessons_on_youtube_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "description"
    t.string "slug"
    t.boolean "featured"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "featured_cover"
    t.string "testimonial_text"
    t.string "testimonial_author"
    t.string "testimonial_link"
    t.index ["slug"], name: "index_newsletters_on_slug", unique: true
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.string "cover"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "featured"
    t.index ["slug"], name: "index_podcasts_on_slug", unique: true
  end

  create_table "screencasts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_screencasts_on_slug", unique: true
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_tags_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "youtubes", force: :cascade do |t|
    t.string "title"
    t.string "cover"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_youtubes_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authorings", "authors"
  add_foreign_key "lessons", "youtubes"
  add_foreign_key "taggings", "tags"
end
