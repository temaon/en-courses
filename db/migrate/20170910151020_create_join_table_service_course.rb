# frozen_string_literal: true

class CreateJoinTableServiceCourse < ActiveRecord::Migration[5.1]
  def change
    create_join_table :services, :courses do |t|
      t.index %i[service_id course_id]
      t.index %i[course_id service_id]
    end
  end
end
