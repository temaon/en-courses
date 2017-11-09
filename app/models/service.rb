# frozen_string_literal: true

# == Schema Information
#
# Table name: services
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  short_description :string(255)
#  description       :text(65535)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Service < ApplicationRecord
  include RailsAdminCharts

  has_and_belongs_to_many :courses
  accepts_nested_attributes_for :courses, allow_destroy: true

  has_one :icon, as: :assetable, class_name: 'Modules::Service::Icon', dependent: :delete, inverse_of: :assetable
  accepts_nested_attributes_for :icon, allow_destroy: true
  validates :icon, presence: true
end
