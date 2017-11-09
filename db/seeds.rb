# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'rolify'

include Faker

# Slider.destroy_all
# 10.times do |i|
#   puts "Slider #{i}"
#   s = Slider.create({
#     title: Faker::Educator.university,
#     url: Faker::Internet.url('google.com'),
#     slide_type: (0..2).to_a.sample,
#     show: true
#   })
#   f = Modules::Slider::SlideImage.new(data: open(URI.parse(Faker::LoremPixel.image("1920x850")), :read_timeout => 240, open_timeout: 120))
#   f.data_file_name += '.jpg'
#   s.slide_image = f
#   s.save!
# end
#
# Partner.destroy_all
# 10.times do |i|
#   puts "Partner #{i}"
#   p = Partner.create({
#                         name: Faker::Educator.university,
#                         site_url: Faker::Internet.url('google.com'),
#                         description: Faker::Lorem.paragraph(2, false, 4)
#                     })
#   i = Modules::Partner::Icon.new(data: open(URI.parse(Faker::LoremPixel.image("148x98")), :read_timeout => 180, open_timeout: 120))
#   i.data_file_name += '.jpg'
#   p.icon = i
#   p.save!
# end
#
#
# Service.destroy_all
# 5.times do |i|
#   puts "Service #{i}"
#   s = Service.create({
#                          title: Faker::Book.title,
#                          short_description: Faker::Lorem.paragraph(1, false, 3),
#                          description: Faker::Lorem.paragraph(5, false, 10)
#                      })
#   i = Modules::Service::Icon.new(data: open(URI.parse(Faker::LoremPixel.image("350x250")), :read_timeout => 240, open_timeout: 120))
#   i.data_file_name += '.jpg'
#   s.icon = i
#   s.save!
# end
#
# old_admin = User.first
# old_admin.destroy if old_admin.present?
#
# u = User.new
# u.username = :admin
# u.email = 'test@example.com'
# u.name = 'Admin Adminovich'
# u.password = 'password'
# u.confirmed_at = Time.now
# u.add_role 'admin'
# u.type = 'User'
# u.save!
#
# Teacher.destroy_all
# 5.times do |i|
#   puts "Teacher #{i}"
#   t = Teacher.new
#   t.name = Faker::Name.name
#   t.username = "fake_teacher_#{i}"
#   t.email = Faker::Internet.email
#   t.password = 'password'
#   t.position = Faker::Company.profession
#   t.phone = Faker::Company.swedish_organisation_number
#   t.social_sk = Faker::Internet.domain_name
#   t.social_vk = Faker::Internet.url('vk.com')
#   t.social_fb = Faker::Internet.url('fb.com')
#   t.confirmed_at = Time.now()
#   a = Modules::User::Avatar.new(data: open(URI.parse(Faker::LoremPixel.image("300x460", false, 'people')), :read_timeout => 240, open_timeout: 120))
#   a.data_file_name += '.jpg'
#   t.add_role 'teacher'
#   t.type = 'Teacher'
#   t.avatar = a
#   t.save!
# end

# Category.destroy_all
# 5.times do |i|
#   c = Category.new
#   c.title = Faker::Book.genre
#   c.save!
# end

Course.destroy_all
20.times do |i|
  puts "Course #{i}"
  c = Course.new
  c.title = Faker::Lorem.sentence(3)
  c.short_description = Faker::Lorem.paragraph(2, false, 4)
  c.description = Faker::Lorem.paragraph(1)
  c.price = Faker::Commerce.price
  c.students_count = (5..10).to_a.sample
  c.duration_type = nil
  c.date_start = Faker::Date.between(2.month.ago, Date.today)
  c.date_end = Faker::Date.between(Date.today, 2.month.from_now)
  c.duration = (4..8).to_a.sample
  c.is_main = Faker::Boolean.boolean(0.3)
  c.user = User.first
  c.category = Category.order("RAND()").first
  c.teachers << Teacher.order("RAND()").limit((1..3).to_a.sample)
  (1 .. (1..5).to_a.sample).each do |item|
    img = Modules::Course::Image.new(data: open(URI.parse(Faker::LoremPixel.image("1920x900")), :read_timeout => 400, open_timeout: 120))
    img.data_file_name += '.jpg'
    c.images << img
  end
  img_ban =  Modules::Course::ImageBanner.new(data: open(URI.parse(Faker::LoremPixel.image("1920x340")), :read_timeout => 400, open_timeout: 120))
  img_ban.data_file_name += '.jpg'
  c.image_banners << img_ban
  c.save!
end

News.destroy_all
25.times do |i|
  puts "News #{i}"
  n = News.new
  n.title = Faker::Lorem.sentence(3)
  n.short_description = Faker::Lorem.paragraph(2, false, 4)
  n.description = Faker::Lorem.paragraph(9)
  n.date = Faker::Date.between(2.months.ago, Date.today)
  n.is_main = Faker::Boolean.boolean(0.3)
  n.user = Teacher.order('RAND()').first
  n.category = Category.order('RAND()').first
  (1..(1..5).to_a.sample).each do |_item|
    img = Modules::News::Image.new(data: open(URI.parse(Faker::LoremPixel.image('1920x900')), read_timeout: 400, open_timeout: 120))
    img.data_file_name += '.jpg'
    n.images << img
  end
  n.save!
end
