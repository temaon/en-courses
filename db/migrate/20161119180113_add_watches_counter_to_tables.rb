# frozen_string_literal: true

class AddWatchesCounterToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :watches_count, :integer, default: 0
  end
end