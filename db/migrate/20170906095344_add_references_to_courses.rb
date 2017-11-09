# frozen_string_literal: true

class AddReferencesToCourses < ActiveRecord::Migration[5.0]
  def change
    change_table :courses do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, class_name: 'User', index: true, foreign_key: true
    end

    create_table :courses_teachers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
    end
  end
end
