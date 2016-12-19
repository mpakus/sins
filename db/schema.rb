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

ActiveRecord::Schema.define(version: 20161219183884) do

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "storytime_actions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["guid"], name: "index_storytime_actions_on_guid", using: :btree
  end

  create_table "storytime_autosaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",          limit: 65535
    t.string   "autosavable_type"
    t.integer  "autosavable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["autosavable_type", "autosavable_id"], name: "autosavable_index", using: :btree
    t.index ["site_id"], name: "index_storytime_autosaves_on_site_id", using: :btree
  end

  create_table "storytime_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["post_id"], name: "index_storytime_comments_on_post_id", using: :btree
    t.index ["site_id"], name: "index_storytime_comments_on_site_id", using: :btree
    t.index ["user_id"], name: "index_storytime_comments_on_user_id", using: :btree
  end

  create_table "storytime_links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "text"
    t.integer  "storytime_navigation_id"
    t.string   "linkable_type"
    t.integer  "linkable_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position"
    t.string   "url"
    t.index ["linkable_type", "linkable_id"], name: "index_storytime_links_on_linkable_type_and_linkable_id", using: :btree
    t.index ["position"], name: "index_storytime_links_on_position", using: :btree
    t.index ["storytime_navigation_id"], name: "index_storytime_links_on_storytime_navigation_id", using: :btree
  end

  create_table "storytime_media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["site_id"], name: "index_storytime_media_on_site_id", using: :btree
    t.index ["user_id"], name: "index_storytime_media_on_user_id", using: :btree
  end

  create_table "storytime_memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "storytime_role_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["site_id"], name: "index_storytime_memberships_on_site_id", using: :btree
    t.index ["storytime_role_id"], name: "index_storytime_memberships_on_storytime_role_id", using: :btree
    t.index ["user_id"], name: "index_storytime_memberships_on_user_id", using: :btree
  end

  create_table "storytime_navigations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "handle"
    t.integer  "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_storytime_navigations_on_site_id", using: :btree
  end

  create_table "storytime_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role_id"
    t.integer  "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["action_id"], name: "index_storytime_permissions_on_action_id", using: :btree
    t.index ["role_id"], name: "index_storytime_permissions_on_role_id", using: :btree
    t.index ["site_id"], name: "index_storytime_permissions_on_site_id", using: :btree
  end

  create_table "storytime_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.text     "content",               limit: 65535
    t.text     "excerpt",               limit: 65535
    t.datetime "published_at"
    t.integer  "featured_media_id"
    t.boolean  "featured",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "secondary_media_id"
    t.integer  "site_id"
    t.boolean  "notifications_enabled",               default: false
    t.datetime "notifications_sent_at"
    t.integer  "blog_id"
    t.index ["blog_id"], name: "index_storytime_posts_on_blog_id", using: :btree
    t.index ["slug"], name: "index_storytime_posts_on_slug", using: :btree
    t.index ["user_id"], name: "index_storytime_posts_on_user_id", using: :btree
  end

  create_table "storytime_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_storytime_roles_on_name", using: :btree
  end

  create_table "storytime_sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "post_slug_style",         default: 0
    t.string   "ga_tracking_id"
    t.integer  "root_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subscription_email_from"
    t.string   "layout"
    t.string   "disqus_forum_shortname"
    t.integer  "user_id"
    t.string   "custom_domain"
    t.string   "discourse_name"
    t.index ["root_post_id"], name: "index_storytime_sites_on_root_post_id", using: :btree
    t.index ["user_id"], name: "index_storytime_sites_on_user_id", using: :btree
  end

  create_table "storytime_snippets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["name"], name: "index_storytime_snippets_on_name", using: :btree
  end

  create_table "storytime_subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.boolean  "subscribed", default: true
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["token"], name: "index_storytime_subscriptions_on_token", using: :btree
  end

  create_table "storytime_taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["post_id"], name: "index_storytime_taggings_on_post_id", using: :btree
    t.index ["site_id"], name: "index_storytime_taggings_on_site_id", using: :btree
    t.index ["tag_id"], name: "index_storytime_taggings_on_tag_id", using: :btree
  end

  create_table "storytime_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "storytime_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",          limit: 65535
    t.integer  "user_id"
    t.string   "versionable_type"
    t.integer  "versionable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.index ["site_id"], name: "index_storytime_versions_on_site_id", using: :btree
    t.index ["user_id"], name: "index_storytime_versions_on_user_id", using: :btree
    t.index ["versionable_type", "versionable_id"], name: "versionable_index", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "storytime_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "storytime_links", "storytime_navigations"
end
