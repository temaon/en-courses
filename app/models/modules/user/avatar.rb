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

class Modules::User::Avatar < Attachment
  delegate :path, :url, :content_type, to: :data

  has_attached_file :data, styles: {
    small: '25x25#',
    thumb: '116x116',
    content: '400x220#',
    thumb_small: '90x70#',
    fancy: '300x460#',
    medium: '425x280#',
    gallery: '1920x550#',
    full_content: '800>'
  }
  belongs_to :assetable, polymorphic: true, inverse_of: :avatar

  rails_admin do
    include_all_fields
    exclude_fields :type, :width, :height
  end
end
