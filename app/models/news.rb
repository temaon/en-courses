# frozen_string_literal: true

# == Schema Information
#
# Table name: news
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  short_description :text(65535)
#  description       :text(65535)
#  category_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  date              :datetime
#  is_main           :boolean          default(TRUE)
#  watches_count     :integer          default(0)
#  slug              :string(255)
#
# Indexes
#
#  index_news_on_category_id  (category_id)
#

class News < ApplicationRecord
  extend FriendlyId
  include RailsAdmin::News
  include RailsAdminCharts

  LATEST_NEWS_LIMIT = 9
  POPULAR_NEWS_LIMIT = 10

  # Relations
  belongs_to :category, inverse_of: :news, class_name: 'Category', foreign_key: :category_id

  has_many :images, as: :assetable, class_name: '::Modules::News::Image', dependent: :destroy, inverse_of: :assetable
  accepts_nested_attributes_for :images, allow_destroy: true

  has_one :video, as: :assetable, class_name: '::Modules::News::Video', dependent: :destroy, inverse_of: :assetable
  accepts_nested_attributes_for :video, allow_destroy: true

  belongs_to :user, inverse_of: :news

  has_one :slider, as: :postable, inverse_of: :postable
  accepts_nested_attributes_for :slider, allow_destroy: true
  validates :slider, presence: false

  # Validators
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true

  friendly_id :slug_candidates, use: %i[slugged finders]

  # Impressionist
  is_impressionable counter_cache: true, column_name: :watches_count, unique: :request_hash

  acts_as_taggable

  acts_as_taggable_on :tags

  paginates_per 10

  # acts_as_commontable

  # searchable auto_index: true, auto_remove: true do
  #   text :description
  #   text :title
  #   string  :slug_title do
  #     slug.try(:slug)
  #   end
  # end

  # Scopes
  default_scope -> { includes(:category, :images) }

  scope :latest, ->(limit = LATEST_NEWS_LIMIT) { order(created_at: :desc).limit(limit) }
  scope :main_scope, ->(limit = LATEST_NEWS_LIMIT) { where('news.is_main =?', true).latest(limit) }
  scope :popular_news, ->(limit = POPULAR_NEWS_LIMIT) { includes(:category, :images).where('news.watches_count >?', 0).order('news.watches_count DESC').limit(limit) }
  scope :by_date, ->(day, month, year) do
    query_str = "#{year.present? ? 'YEAR(date) = ' + year.to_s : nil} #{month.present? ? 'and MONTH(date) = ' + month.to_s : nil} #{day.present? ? 'and DAY(date) = ' + day.to_s : nil}"
    where(query_str)
  end

  def create_associated_image(image)
    images.create(file: image)
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
    News.joins(:category).where('news.id > ? AND categories.id = ?', id, category.id).order('news.id ASC')
  end

  def prev
    News.joins(:category).where('news.id < ? AND categories.id = ?', id, category.id).order('news.id DESC')
  end
end
