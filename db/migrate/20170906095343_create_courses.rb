# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :slug, index: true, unique: true
      t.string :short_description
      t.text :description
      t.integer :price, limit: 6
      t.integer :students_count
      t.string :duration_type
      t.integer :duration
      t.datetime :date_start
      t.datetime :date_end
      t.timestamps
    end
  end
end
