# frozen_string_literal: true

class AddIsMainFieldToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_main, :boolean, default: false
    add_column :courses, :watches_count, :integer, default: 0
  end
end
