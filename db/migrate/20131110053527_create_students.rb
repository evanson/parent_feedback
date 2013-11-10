class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :phone
      t.string :email
      t.string :password
      t.integer :parent_id
      t.string :center_id

      t.timestamps
    end
  end
end
