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

class Attachment < Ckeditor::Picture
  include RailsAdminCharts
  delegate :path, :url, to: :data

  before_validation :set_file_content

  # attr_accessor :file, :assetable_id, :file_file_name
  def title
    "#{id}-image"
  end

  def url_content
    url(:content)
  end

  def type=(sType)
    super(sType.to_s.classify.constantize.base_class.to_s)
  end

  def set_type # If you don't implement this method, an error will be raised
    self.type = 'Attachment'
  end

  def set_file_content
    data.instance_write(:content_type, Paperclip.io_adapters.for(File.open(data.path)).content_type) if data.content_type == 'inode/x-empty'
  end
end
