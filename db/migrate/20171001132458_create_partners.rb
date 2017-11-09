# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :slug
      t.string :site_url
      t.string :description
      t.timestamps
    end
  end
end
