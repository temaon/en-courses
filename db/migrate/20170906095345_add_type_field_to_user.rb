# frozen_string_literal: true

class AddTypeFieldToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :type
    end
  end
end
