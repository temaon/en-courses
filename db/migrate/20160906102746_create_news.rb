# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps
    end
    add_column :news, :user_id, :integer
    add_column :news, :date, :datetime
    add_column :news, :is_main, :boolean, default: true
    add_column :news, :watches_count, :integer, default: 0
  end
end
