# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  watches_count          :integer          default(0)
#  type                   :string(255)
#  position               :string(255)
#  description            :text(65535)
#  social_vk              :string(255)
#  social_sk              :string(255)
#  social_fb              :string(255)
#  phone                  :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class Teacher < User
  include RailsAdminCharts
  has_and_belongs_to_many :courses, class_name: 'Course', inverse_of: :teachers, join_table: :courses_teachers, association_foreign_key: :course_id, foreign_key: :user_id
end
