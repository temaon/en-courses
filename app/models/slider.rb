# frozen_string_literal: true

# == Schema Information
#
# Table name: sliders
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  url           :string(255)
#  slide_type    :integer          default("slotslide-vertical")
#  show          :boolean          default(TRUE)
#  postable_type :string(255)
#  postable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#
# Indexes
#
#  index_sliders_on_postable_type_and_postable_id  (postable_type,postable_id)
#

class Slider < ApplicationRecord
  include RailsAdminCharts
  # include RailsAdmin::MainBanner
  #
  has_one :slide_image, as: :assetable, class_name: 'Modules::Slider::SlideImage', dependent: :delete, inverse_of: :assetable
  accepts_nested_attributes_for :slide_image, allow_destroy: true
  validates :slide_image, presence: true

  enum slide_type: %w[slotslide-vertical boxslide 3dcurtain-vertical]
  #
  default_scope -> { includes(:slide_image) }
  scope :for_showing, -> { where(show: true).order('created_at DESC') }

  belongs_to :postable, polymorphic: true, inverse_of: :slider, validate: false, required: false

  rails_admin do
    configure :postable do
    end
  end
end
