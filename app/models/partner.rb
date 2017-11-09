# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  site_url    :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Partner < ApplicationRecord
  include RailsAdminCharts
  has_one :icon, as: :assetable, class_name: 'Modules::Partner::Icon', dependent: :delete, inverse_of: :assetable
  accepts_nested_attributes_for :icon, allow_destroy: true
  validates :icon, presence: true
end
