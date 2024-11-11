# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :terms_of_service, :boolean, default: false

    add_index :users, :username
  end
end
