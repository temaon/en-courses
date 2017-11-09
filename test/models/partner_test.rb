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

require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
