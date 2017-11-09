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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
