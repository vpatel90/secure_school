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

ActiveRecord::Schema.define(version: 20160406034547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concentrations", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "concentrations", ["course_id"], name: "index_concentrations_on_course_id", using: :btree
  add_index "concentrations", ["teacher_id"], name: "index_concentrations_on_teacher_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "school_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "motto"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "students_count", default: 0
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teachers", ["school_id"], name: "index_teachers_on_school_id", using: :btree

  add_foreign_key "concentrations", "courses"
  add_foreign_key "concentrations", "teachers"
  add_foreign_key "courses", "schools"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "students"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
end
