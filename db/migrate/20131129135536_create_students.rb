class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.integer :center_id

      t.timestamps
    end
  end
end
