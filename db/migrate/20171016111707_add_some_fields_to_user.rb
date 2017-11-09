# frozen_string_literal: true

class AddSomeFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :position, :string
    add_column :users, :description, :text
    add_column :users, :social_vk, :string
    add_column :users, :social_sk, :string
    add_column :users, :social_fb, :string
    add_column :users, :phone, :string
  end
end
