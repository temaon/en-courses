# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @slides = Slider.for_showing
    @services = Service.includes(:icon).order('created_at DESC').limit(4)
    @courses = Course.includes(:category).where(is_main: true).decorate
    @partners = Partner.includes(:icon).order('created_at DESC').all
    @courses_categories = @courses.map { |course| { title: course.category.title, class: ".category_class_#{course.category.id}" } }.uniq
    @teachers = Teacher.order('created_at DESC').all
    render 'home/index'
  end
end
