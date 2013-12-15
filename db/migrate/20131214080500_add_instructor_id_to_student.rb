class AddInstructorIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :instructor_id, :integer
  end
end
