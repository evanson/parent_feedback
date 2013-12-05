class CreateStudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects, :id => false do |t|
      t.integer :student_id, :null => false
      t.integer :subject_id, :null => false
    end

    add_index :students_subjects, [:student_id, :subject_id], :unique => true
  end
end
