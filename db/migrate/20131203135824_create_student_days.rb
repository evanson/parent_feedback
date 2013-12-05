class CreateStudentDays < ActiveRecord::Migration
  def change
    create_table :student_days do |t|
      t.integer :student_id
      t.integer :center_day_id

      t.timestamps
    end
  end
end
