class CreateConferencesUsers < ActiveRecord::Migration
  def change
    create_table :conferences_users, :id => false do |t|
      t.integer :conference_id, :null => false
      t.integer :user_id, :null => false
    end

    # Add index to ensure we speed up looking the connection, and ensure
    # a parent can only attend each conference once
    add_index :conferences_users, [:conference_id, :user_id], :unique => true
  end
end
