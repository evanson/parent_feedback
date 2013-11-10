class CreateConfAttendances < ActiveRecord::Migration
  def change
    create_table :conf_attendances do |t|
      t.integer :conference_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
