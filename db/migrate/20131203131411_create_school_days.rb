class CreateSchoolDays < ActiveRecord::Migration
  def change
    create_table :school_days do |t|
      t.string :name
      t.string :abbrev

      t.timestamps
    end
  end
end
