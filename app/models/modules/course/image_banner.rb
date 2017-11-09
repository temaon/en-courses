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

class Modules::Course::ImageBanner < Attachment
  has_attached_file :data, styles: {
    small: '25x20#',
    thumb: '116x116',
    content: '800>',
    thumb_small: '90x70#',
    fancy: '230x390#',
    medium: '425x280#',
    gallery: '710x450#',
    full_content: '800>',
    banner: '1920x340#'
  },
                           default_url: 'default/:style/default.jpg',
                           path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                           url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension'
  validates_attachment_content_type :data, content_type: /\Aimage/

  belongs_to :assetable, polymorphic: true, inverse_of: :image_banners

  rails_admin do
    visible false
    exclude_fields :type
  end

  scope :latest, -> { order('ckeditor_assets.created_at DESC') }

  def set_type # If you don't implement this method, an error will be raised
    self.type = 'Modules::Course::ImageBanner'
  end
end
