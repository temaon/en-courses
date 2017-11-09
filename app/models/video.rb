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

class Video < Attachment
  VIDEO_CONTENT_TYPE = 'youtube_video'
  LATEST_VIDEOS_LIMIT = 5
  self.table_name = :ckeditor_assets

  belongs_to :assetable, polymorphic: true, inverse_of: :video

  validates :data_file_name, presence: true

  after_initialize do
    if new_record?
      self.data_content_type = VIDEO_CONTENT_TYPE
      self.data_file_size = 0
      self.type = @type || self.class.to_s
    end
  end

  def url_thumb
    "http://img.youtube.com/vi/#{file_file_name}/hqdefault.jpg"
  end

  def video_player
    "https://www.youtube.com/embed/#{file_file_name}?autoplay=0"
  end

  rails_admin do
    visible false
  end

  default_scope { where(data_content_type: VIDEO_CONTENT_TYPE) }

  scope :latest, ->(limit = LATEST_VIDEOS_LIMIT) { order(created_at: :desc).limit(limit) }
end
