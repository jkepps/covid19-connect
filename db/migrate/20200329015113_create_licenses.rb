# frozen_string_literal: true

class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.boolean :active, default: true
      t.date :expiration_date
      t.string :number, null: false
      t.string :full_name, null: false
      t.string :state, limit: 2, null: false
      t.references :volunteer

      t.timestamps
    end
  end
end
