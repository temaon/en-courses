# frozen_string_literal: true

class AddDescriptionFieldToSliders < ActiveRecord::Migration[5.1]
  def change
    add_column(:sliders, :description, :string)
  end
end
