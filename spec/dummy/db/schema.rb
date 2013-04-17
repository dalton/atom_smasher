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

ActiveRecord::Schema.define(:version => 20130409172131) do

  create_table "atom_smasher_feeds", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.string   "author"
    t.string   "webMaster"
    t.string   "managingEditor"
    t.string   "contributor"
    t.string   "pubDate"
    t.string   "lastBuildDate"
    t.string   "updated"
    t.string   "dc_date"
    t.string   "generator"
    t.string   "language"
    t.string   "docs"
    t.string   "cloud"
    t.string   "ttl"
    t.string   "skipHours"
    t.string   "skipDays"
    t.string   "image"
    t.string   "logo"
    t.string   "icon"
    t.string   "rating"
    t.string   "rights"
    t.string   "copyright"
    t.string   "textInput"
    t.string   "feedburner_browserFriendly"
    t.string   "itunes_author"
    t.string   "itunes_category"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "atom_smasher_posts", :force => true do |t|
    t.integer  "feed_id"
    t.string   "title"
    t.string   "link"
    t.string   "link_alternate"
    t.string   "link_self"
    t.string   "link_edit"
    t.string   "link_replies"
    t.string   "author"
    t.string   "contributor"
    t.string   "description"
    t.string   "summary"
    t.string   "content"
    t.string   "content_encoded"
    t.string   "comments"
    t.string   "pubDate"
    t.string   "published"
    t.string   "updated"
    t.string   "expirationDate"
    t.string   "modified"
    t.string   "dc_date"
    t.string   "category"
    t.string   "guid"
    t.string   "trackback_ping"
    t.string   "trackback_about"
    t.string   "dc_creator"
    t.string   "dc_title"
    t.string   "dc_subject"
    t.string   "dc_rights"
    t.string   "dc_publisher"
    t.string   "feedburner_origLink"
    t.string   "media_content_url"
    t.string   "media_content_type"
    t.string   "media_content_height"
    t.string   "media_content_width"
    t.string   "media_title"
    t.string   "media_thumbnail_url"
    t.string   "media_thumbnail_height"
    t.string   "media_thumbnail_width"
    t.string   "media_credit"
    t.string   "media_credit_role"
    t.string   "media_category"
    t.string   "media_category_scheme"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "atom_smasher_subscriptions", :force => true do |t|
    t.integer  "reader_id"
    t.integer  "feed_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
