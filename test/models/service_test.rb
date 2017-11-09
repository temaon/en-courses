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

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
