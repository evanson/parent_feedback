class CreateCenterDays < ActiveRecord::Migration
  def change
    create_table :center_days do |t|
      t.integer :center_id
      t.integer :school_day_id

      t.timestamps
    end
  end
end
