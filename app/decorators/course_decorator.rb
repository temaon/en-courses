# frozen_string_literal: true

class CourseDecorator < MainDecorator
  delegate :current_page, :per_page, :offset, :total_entries, :total_pages

  def main_image(format = :gallery)
    object.images.try(:first).try(:url, format).to_s.presence
  end

  def banner_image(format = :gallery)
    object.images.try(:second).try(:url, format).to_s.presence
  end

  #
  # def formatted_date(format = '%d %b, %Y')
  #   object.date.present? ? I18n.l(object.date, format: format) : nil
  # end
  #
  # def has_video?
  #   video_link.present? || video_content.present?
  # end
  #
  # def has_video_info?
  #   get_video_info.present?
  # end
  #
  # def get_video_info
  #   VideoInfo.new(video_link) rescue nil
  # end
end
