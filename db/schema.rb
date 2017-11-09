# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_171_018_183_333) do
  create_table 'admin_notices', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'message'
    t.boolean 'published'
  end

  create_table 'categories', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.string 'slug'
    t.integer 'parent_id'
    t.integer 'lft', null: false
    t.integer 'rgt', null: false
    t.integer 'depth', default: 0, null: false
    t.integer 'children_count', default: 0, null: false
    t.timestamp 'created_at'
    t.timestamp 'updated_at'
    t.index ['lft'], name: 'index_categories_on_lft'
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
    t.index ['rgt'], name: 'index_categories_on_rgt'
    t.index ['slug'], name: 'index_categories_on_slug'
  end

  create_table 'ckeditor_assets', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'data_file_name', null: false
    t.string 'data_content_type'
    t.integer 'data_file_size'
    t.string 'data_fingerprint'
    t.integer 'assetable_id'
    t.string 'assetable_type', limit: 30
    t.string 'type', limit: 30
    t.integer 'width'
    t.integer 'height'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[assetable_type assetable_id], name: 'idx_ckeditor_assetable'
    t.index %w[assetable_type type assetable_id], name: 'idx_ckeditor_assetable_type'
  end

  create_table 'courses', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.string 'slug'
    t.string 'short_description'
    t.text 'description'
    t.bigint 'price'
    t.integer 'students_count'
    t.string 'duration_type'
    t.integer 'duration'
    t.datetime 'date_start'
    t.datetime 'date_end'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'category_id'
    t.integer 'user_id'
    t.boolean 'is_main', default: false
    t.integer 'watches_count', default: 0
    t.index ['category_id'], name: 'index_courses_on_category_id'
    t.index ['slug'], name: 'index_courses_on_slug'
    t.index ['user_id'], name: 'index_courses_on_user_id'
  end

  create_table 'courses_services', id: false, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.bigint 'service_id', null: false
    t.bigint 'course_id', null: false
    t.index %w[course_id service_id], name: 'index_courses_services_on_course_id_and_service_id'
    t.index %w[service_id course_id], name: 'index_courses_services_on_service_id_and_course_id'
  end

  create_table 'courses_teachers', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'user_id'
    t.integer 'course_id'
    t.index ['course_id'], name: 'index_courses_teachers_on_course_id'
    t.index ['user_id'], name: 'index_courses_teachers_on_user_id'
  end

  create_table 'impressions', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'impressionable_type'
    t.integer 'impressionable_id'
    t.integer 'user_id'
    t.string 'controller_name'
    t.string 'action_name'
    t.string 'view_name'
    t.string 'request_hash'
    t.string 'ip_address'
    t.string 'session_hash'
    t.text 'message'
    t.text 'referrer'
    t.text 'params'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[controller_name action_name ip_address], name: 'controlleraction_ip_index', length: { ip_address: 100 }
    t.index %w[controller_name action_name request_hash], name: 'controlleraction_request_index', length: { request_hash: 100 }
    t.index %w[controller_name action_name session_hash], name: 'controlleraction_session_index', length: { session_hash: 100 }
    t.index %w[impressionable_type impressionable_id ip_address], name: 'poly_ip_index'
    t.index %w[impressionable_type impressionable_id params], name: 'poly_params_request_index', length: { params: 100 }
    t.index %w[impressionable_type impressionable_id request_hash], name: 'poly_request_index'
    t.index %w[impressionable_type impressionable_id session_hash], name: 'poly_session_index'
    t.index %w[impressionable_type message impressionable_id], name: 'impressionable_type_message_index', length: { message: 255 }
    t.index ['user_id'], name: 'index_impressions_on_user_id'
  end

  create_table 'news', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.text 'short_description'
    t.text 'description'
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.datetime 'date'
    t.boolean 'is_main', default: true
    t.integer 'watches_count', default: 0
    t.string 'slug'
    t.index ['category_id'], name: 'index_news_on_category_id'
  end

  create_table 'partners', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name'
    t.string 'slug'
    t.string 'site_url'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['name'], name: 'index_roles_on_name'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'services', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.string 'short_description'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sliders', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.string 'url'
    t.integer 'slide_type', default: 0
    t.boolean 'show', default: true
    t.string 'postable_type'
    t.integer 'postable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'description'
    t.index %w[postable_type postable_id], name: 'index_sliders_on_postable_type_and_postable_id'
  end

  create_table 'taggings', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'index_taggings_on_taggable_id_and_taggable_type_and_context'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index %w[taggable_type taggable_id], name: 'index_taggings_on_taggable_type_and_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
    t.index %w[tagger_type tagger_id], name: 'index_taggings_on_tagger_type_and_tagger_id'
  end

  create_table 'tags', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', collation: 'utf8_bin'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'username'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.integer 'watches_count', default: 0
    t.string 'type'
    t.string 'position'
    t.text 'description'
    t.string 'social_vk'
    t.string 'social_sk'
    t.string 'social_fb'
    t.string 'phone'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'courses', 'categories'
  add_foreign_key 'courses', 'users'
  add_foreign_key 'courses_teachers', 'courses'
  add_foreign_key 'courses_teachers', 'users'
  add_foreign_key 'news', 'categories'
end
