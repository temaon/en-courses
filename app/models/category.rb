# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  slug           :string(255)
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_categories_on_lft        (lft)
#  index_categories_on_parent_id  (parent_id)
#  index_categories_on_rgt        (rgt)
#  index_categories_on_slug       (slug)
#

class Category < ApplicationRecord
  include RailsAdminCharts
  extend FriendlyId

  is_impressionable counter_cache: true, column_name: :watches_count, unique: :request_hash

  friendly_id :title, use: %i[slugged finders]

  # enum template: {single: 0, half: 1}

  has_many :courses, dependent: :destroy
  accepts_nested_attributes_for :courses, allow_destroy: true
  has_many :news, dependent: :destroy
  accepts_nested_attributes_for :news, allow_destroy: true

  acts_as_nested_set

  rails_admin do
    include_fields(
      :title
    )
    nested_set(max_depth: 2,
               toggle_fields: [:enabled],
               thumbnail_fields: %i[image cover],
               thumbnail_size: :thumb,
               thumbnail_gem: :paperclip)
  end

  def slug_candidates
    [
      [:title, [parent: :title]]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def template_enum
    %w[single half]
  end
end
