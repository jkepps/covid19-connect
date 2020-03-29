# frozen_string_literal: true

class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :name, null: false
      t.references :profession
      t.string :zip, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
