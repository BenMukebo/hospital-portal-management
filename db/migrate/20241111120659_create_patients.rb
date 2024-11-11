# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :avatar_url
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.date :birdth_day
      t.string :sex
      t.integer :marital_status
      t.jsonb :address, default: {}, null: false
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :patients, :address
    add_index :patients, :status
  end
end
