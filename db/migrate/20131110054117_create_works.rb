class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :student_id
      t.integer :subject_id
      t.date :startdate
      t.date :enddate
      t.string :status

      t.timestamps
    end
  end
end
