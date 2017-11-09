# frozen_string_literal: true

class CoursesController < ApplicationController
  add_breadcrumb 'Главная', :root_path

  impressionist actions: [:show]

  def  show
    @course = Course.friendly.includes(:images).find(params[:id])
    # @related_news = @news.related_posts.limit(3).try(:decorate)
    @prev_course = @course.prev.first.try(:decorate)
    @next_course = @course.next.first.try(:decorate)
    add_breadcrumb @course.category.title, courses_path(@course.category)
    add_breadcrumb @course.title
    # commontator_thread_show(@news) if @news.is_commentable?
    impressionist @course, '', unique: [:session_hash] if @course.present?
    render 'courses/show', locals:
        {
          course: @course.decorate,
          prev_course: @prev_course,
          next_course: @next_course
        }
  end
end
