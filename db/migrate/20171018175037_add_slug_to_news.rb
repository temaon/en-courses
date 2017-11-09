# frozen_string_literal: true

class AddSlugToNews < ActiveRecord::Migration[5.1]
  def change
    add_column(:news, :slug, :string)
  end
end
