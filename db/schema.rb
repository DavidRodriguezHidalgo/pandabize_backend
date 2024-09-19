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

ActiveRecord::Schema[7.2].define(version: 2024_09_17_130919) do
  create_table "brands", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands_features", id: false, charset: "utf8", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "feature_id", null: false
  end

  create_table "feature_values", charset: "utf8", force: :cascade do |t|
    t.string "value"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_feature_values_on_feature_id"
  end

  create_table "feature_values_limit_values", id: false, charset: "utf8", force: :cascade do |t|
    t.bigint "feature_value_id", null: false
    t.bigint "limit_value_id", null: false
  end

  create_table "features", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "limit_values", charset: "utf8", force: :cascade do |t|
    t.bigint "limit_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_limit_values_on_feature_id"
    t.index ["limit_id"], name: "index_limit_values_on_limit_id"
  end

  create_table "limits", charset: "utf8", force: :cascade do |t|
    t.bigint "feature_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_value_id"], name: "index_limits_on_feature_value_id"
  end

  create_table "orders", charset: "utf8", force: :cascade do |t|
    t.float "amount"
    t.text "items", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
