class AddCenterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :center_id, :integer
  end
end
