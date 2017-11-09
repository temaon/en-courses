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

class User < ApplicationRecord
  # include RailsAdmin::User

  after_create :assign_default_role
  before_save :set_default_type

  # impressionist
  is_impressionable counter_cache: true, column_name: :watches_count, unique: :request_hash

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :courses, dependent: :destroy, inverse_of: :user

  has_many :news, dependent: :destroy, inverse_of: :user

  has_one :avatar, as: :assetable, class_name: 'Modules::User::Avatar', dependent: :delete, inverse_of: :assetable
  accepts_nested_attributes_for :avatar, allow_destroy: true
  # validates_presence_of :avatar

  # acts_as_commontator

  def is_admin?
    has_role? :admin
  end

  def set_default_type
    self.type = 'Student' if type.blank?
  end

  private

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
