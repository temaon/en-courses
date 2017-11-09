# frozen_string_literal: true

class AddCreatedAtToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column(:categories, :created_at, :timestamp)
    add_column(:categories, :updated_at, :timestamp)
  end
end
