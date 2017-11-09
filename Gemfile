# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# A modern, simple and very fast Mysql library for Ruby - binding to libmysql http://github.com/brianmario/mysql2
gem 'mysql2', '0.4.4'

gem 'jquery-rails'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets

gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord. It allows you to create pretty URL’s and work with human-friendly strings as if they were numeric ids for ActiveRecord models. http://norman.github.io/friendly_id/
gem 'babosa'
gem 'friendly_id', '~> 5.1.0'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'

# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'
gem 'rails_admin_rollincode'
gem 'remotipart', github: 'mshibuya/remotipart'
# gem 'rails_admin_flatly_theme', github: 'konjoot/rails_admin_flatly_theme'

gem 'ckeditor'
# Translations for the rails_admin gem
gem 'rails_admin-i18n'
# Highcharts Action for Rails Admin
gem 'rails_admin_charts'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Haml-rails https://github.com/indirect/haml-rails
gem 'haml-rails'

# An awesome replacement for acts_as_nested_set and better_nested_set.
gem 'awesome_nested_set'
gem 'rails_admin_nested_set', '0.5.3'
# Easy to use integration of drag&drop files upload via dropzone.js for rails_admin
gem 'rails_admin_dropzone', '~> 1.0', '>= 1.0.5'
# Easy file attachment management for ActiveRecord https://thoughtbot.com/open-source
gem 'image_optim_bin'
gem 'paperclip'
gem 'paperclip-optimizer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'pry-rails'
  gem 'haml-i18n', require: false
  gem 'rubocop', '~> 0.51.0', require: false
  gem 'faker', git: 'git://github.com/stympy/faker.git', branch: 'master'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'acts-as-taggable-on', '~> 4.0'

# Rails Plugin that tracks impressions and page views
gem 'impressionist'

# Front
gem 'autoprefixer-rails'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sitemap_generator'
gem 'swiper-rails'

# Backend / Utils
gem 'ancestry'
gem 'annotate'
gem 'breadcrumbs_on_rails'
gem 'whenever'
gem 'wysiwyg-rails'

gem 'draper', github: 'drapergem/draper'

# Role management library with resource scoping http://rolifycommunity.github.com/rolify/
gem 'rolify'

# A Rails engine for comments
gem 'commontator', '~> 4.10.1'

gem 'select2-rails'
