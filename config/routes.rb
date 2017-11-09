# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :categories
  #   resources :courses, as: :courses
  # resources :news, as: :news
  # end
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: :rails_admin

  get ':category_slug/news/:id', controller: :news, action: :show, as: :news
  get ':category_slug/course/:id', controller: :courses, action: :show, as: :course
  get ':category_slug/course/', controller: :courses, action: :index, as: :courses

  resources :modules_course_image, controller: 'ckeditor_pictures'
  devise_for :users, as: :frontend
end
