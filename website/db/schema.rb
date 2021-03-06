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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140223231002) do

  create_table "event_records", :force => true do |t|
    t.integer  "event_stream_id"
    t.string   "name"
    t.text     "args"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "event_streams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_streams", ["name"], :name => "index_event_streams_on_name", :unique => true

  create_table "id_counters", :force => true do |t|
    t.string   "scope"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "id_counters", ["scope"], :name => "index_id_counters_on_scope", :unique => true

  create_table "planning_conferences", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.string   "location"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "planning_sessions", :force => true do |t|
    t.string   "start_hour"
    t.string   "start_min"
    t.string   "end_hour"
    t.string   "end_min"
    t.integer  "submission_id"
    t.string   "submission_title"
    t.integer  "track_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "planning_submissions", :force => true do |t|
    t.string   "title"
    t.text     "overview"
    t.string   "status"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "planning_tracks", :force => true do |t|
    t.string   "name"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "scheduling_conference_forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "location"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scheduling_conference_views", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "location"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scheduling_conferences", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "location"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scheduling_sessions", :force => true do |t|
    t.string   "time_slot"
    t.string   "title"
    t.integer  "track_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scheduling_topics", :force => true do |t|
    t.string   "title"
    t.text     "overview"
    t.string   "status"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "scheduling_tracks", :force => true do |t|
    t.string   "name"
    t.integer  "conference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "foo"
    t.string   "bar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
