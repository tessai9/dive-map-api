# frozen_string_literal: true

class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :name
      t.string :point_map
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
