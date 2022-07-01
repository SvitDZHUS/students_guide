# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_416_165_654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'author'
    t.string 'publishing_house'
    t.date 'publishing_date'
    t.string 'cover'
    t.string 'file'
    t.string 'language'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books_categories', id: false, force: :cascade do |t|
    t.bigint 'book_id', null: false
    t.bigint 'category_id', null: false
    t.index ['book_id'], name: 'index_books_categories_on_book_id'
    t.index ['category_id'], name: 'index_books_categories_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'category_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone'
    t.date 'birthday'
    t.bigint 'owned_by_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['owned_by_id'], name: 'index_profiles_on_owned_by_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
