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

class Modules::Service::Icon < Attachment
  has_attached_file :data, styles: {
    small: '25x20#',
    thumb: '350x250#',
    content: '80x80#',
    thumb_small: '80x80#',
    full_content: '800>'
  },
                           default_url: 'default/:style/default.jpg',
                           path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                           url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension'
  validates_attachment_content_type :data, content_type: /\Aimage/
  belongs_to :assetable, polymorphic: true, inverse_of: :icon

  rails_admin do
    include_all_fields
    exclude_fields :type, :width, :height
  end

  scope :latest, -> { order('ckeditor_assets.created_at DESC') }

  def set_type
    self.type = 'Modules::Service::Icon'
  end
end
