# frozen_string_literal: true

class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :url
      t.column :slide_type, :integer, default: 0
      t.boolean :show, default: true
      t.references :postable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
