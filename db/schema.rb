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

ActiveRecord::Schema[7.0].define(version: 2023_10_05_130416) do
  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_children", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_parent_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_parent_id"], name: "index_comment_children_on_comment_parent_id"
    t.index ["user_id"], name: "index_comment_children_on_user_id"
  end

  create_table "comment_parents", force: :cascade do |t|
    t.integer "content_id"
    t.integer "user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_comment_parents_on_content_id"
    t.index ["user_id"], name: "index_comment_parents_on_user_id"
  end

  create_table "content_media", force: :cascade do |t|
    t.integer "content_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_content_media_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "status", default: "pending"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_contents_on_category_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.string "status", default: "unread"
    t.string "notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_notifications_on_content_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "student_subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_student_subscriptions_on_content_id"
    t.index ["user_id"], name: "index_student_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.string "deactivated", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_wishlists_on_content_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "comment_children", "comment_parents"
  add_foreign_key "comment_children", "users"
  add_foreign_key "comment_parents", "contents"
  add_foreign_key "comment_parents", "users"
  add_foreign_key "content_media", "contents"
  add_foreign_key "contents", "categories"
  add_foreign_key "contents", "users"
  add_foreign_key "notifications", "contents"
  add_foreign_key "notifications", "users"
  add_foreign_key "student_subscriptions", "contents"
  add_foreign_key "student_subscriptions", "users"
  add_foreign_key "wishlists", "contents"
  add_foreign_key "wishlists", "users"
end
