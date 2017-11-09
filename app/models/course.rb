# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  slug              :string(255)
#  short_description :string(255)
#  description       :text(65535)
#  price             :integer
#  students_count    :integer
#  duration_type     :string(255)
#  date_start        :datetime
#  date_end          :datetime
#  duration          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  is_main           :boolean          default(FALSE)
#  watches_count     :integer          default(0)
#  category_id       :integer
#  user_id           :integer
#
# Indexes
#
#  index_courses_on_category_id  (category_id)
#  index_courses_on_slug         (slug)
#  index_courses_on_user_id      (user_id)
#

class Course < ApplicationRecord
  extend FriendlyId
  include RailsAdmin::Course
  include RailsAdminCharts

  friendly_id :slug_candidates, use: %i[slugged finders]
  acts_as_taggable
  acts_as_taggable_on :tags
  paginates_per 30

  # impressionist
  is_impressionable counter_cache: true, column_name: :watches_count, unique: :request_hash

  belongs_to :category, inverse_of: :courses, class_name: 'Category', foreign_key: :category_id

  belongs_to :user, inverse_of: :courses

  has_many :images, as: :assetable, class_name: 'Modules::Course::Image', dependent: :destroy, inverse_of: :assetable
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :image_banners, as: :assetable, class_name: 'Modules::Course::ImageBanner', dependent: :destroy, inverse_of: :assetable, foreign_key: :assetable_id
  accepts_nested_attributes_for :image_banners, allow_destroy: true
  validates :image_banners, length: { maximum: 1 }

  has_and_belongs_to_many :teachers, class_name: 'Teacher', inverse_of: :courses, join_table: :courses_teachers, association_foreign_key: :user_id, foreign_key: :course_id
  accepts_nested_attributes_for :teachers, allow_destroy: true

  has_one :slider, as: :postable, inverse_of: :postable
  accepts_nested_attributes_for :slider, allow_destroy: true
  validates :slider, presence: false

  has_and_belongs_to_many :services

  def create_associated_image(image)
    images.create(data: image)
  end

  def slug_candidates
    [
      [:title, [category: :title]],
      [:title, [category: :title], [parent: :title]]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def next
    Course.joins(:category).where('courses.id > ? AND categories.id = ?', id, category.id).order('courses.id ASC')
  end

  def prev
    Course.joins(:category).where('courses.id < ? AND categories.id = ?', id, category.id).order('courses.id DESC')
  end

  # rails_admin do
  #   include_all_fields
  #
  #   field :description, :ck_editor
  #
  #   exclude_fields :created_at,
  #                  :updated_at
  #
  #   create do
  #     exclude_fields :thread, :impressions, :user, :slug
  #     field :user_id, :hidden do
  #       def value
  #         bindings[:view]._current_user.id
  #       end
  #     end
  #   end
  #
  #   edit do
  #     exclude_fields :thread, :impressions, :user, :slug
  #     field :teachers do
  #       nested_form false
  #     end
  #     field :user_id, :hidden do
  #       def value
  #         bindings[:view]._current_user.id
  #       end
  #     end
  #   end
  #
  # end
end
