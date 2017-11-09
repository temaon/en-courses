# frozen_string_literal: true

# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string(255)      not null
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_fingerprint  :string(255)
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  idx_ckeditor_assetable       (assetable_type,assetable_id)
#  idx_ckeditor_assetable_type  (assetable_type,type,assetable_id)
#

class Ckeditor::Asset < ApplicationRecord
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip

  def set_type
    raiser 'You must override this method in each model inheriting from Product!'
  end

  def self.inheritance_column
    'type'
  end
end
