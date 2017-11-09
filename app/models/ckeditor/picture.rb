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

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    styles: { full_content: '800>', content: '400x220#', thumb: '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end

  def set_type # If you don't implement this method, an error will be raised
    self.type = 'Ckeditor::Picture'
  end
end
