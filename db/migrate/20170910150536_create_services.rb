# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :title
      t.string :short_description
      t.text :description
      t.timestamps
    end
  end
end
