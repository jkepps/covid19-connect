# frozen_string_literal: true

class CreateProfessions < ActiveRecord::Migration[6.0]
  def change
    create_table :professions do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
