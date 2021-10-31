# frozen_string_literal: true

class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :prefecture, foreign_key: true, null: false

      t.timestamps
    end
  end
end
