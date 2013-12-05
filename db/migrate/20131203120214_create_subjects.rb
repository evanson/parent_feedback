class CreateSubjects < ActiveRecord::Migration
  def change
    drop_table :subjects
    create_table :subjects do |t|
      t.string :name

      t.timestamps
    end
  end
end
